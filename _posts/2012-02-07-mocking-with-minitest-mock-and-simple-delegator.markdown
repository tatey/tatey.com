---
layout: post
title: Mocking with MiniTest::Mock and SimpleDelegator
---

Libraries like [Mocha](http://mocha.rubyforge.org/) let you temporarily change the behaviour of objects. This is especially useful when mocking models in rails functional tests. Many of the built-in helper methods introspect models to generate URLs. The same behaviour can be achieved with [MiniTest::Mock](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/minitest/mock/rdoc/MiniTest/Mock.html) and [SimpleDelegator](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/delegate/rdoc/SimpleDelegator.html). Both classes are included in the standard library, it's fast and there's no monkey patching.

MiniTest::Mock is a factory for creating light weight objects. Behaviour is controlled by defining expectations. The first argument is the method's name and the second argument is the return value. There's an optional third argument for specifying the type of arguments that method takes. 

{% highlight ruby %}
order = MiniTest::Mock.new
order.expect :update_attributes, false, [Hash]
order.expect :valid?, false

order.update_attributes :desc => 'Shirt' # => false
order.valid?                             # => false
{% endhighlight %}

SimpleDelegator forwards all missing method calls to a delegate. Inheriting from SimpleDelegator lets you change the behaviour of methods you care about while preserving the behaviour of everything else. In this example we stop `#valid?` from being forwarded by defining it in an anonymous class. `#attributes` is missing from the anonymous class and is forwarded to the delegate. The initializer takes one argument which is the delegate.

{% highlight ruby %}
class Order < ActiveRecord::Base
  # ...
end

invalid_delegator = Class.new SimpleDelegator do
  def valid?
    false
  end
end

order = invalid_delegator.new Order.new(:desc => 'Shirt')
order.valid?      # => false
order.attributes  # => #<Order desc: 'Shirt'>
{% endhighlight %}

As a rule of thumb you should use MiniTest::Mock unless neighbouring objects expect specific behaviour. In the case of the latter, you'll know when to use SimpleDelegator as methods being called further down the stack are beyond your control and confuse the purpose of your test (Eg: Rails built-in helper methods for generating URLs).

The real power of MiniTest::Mock and SimpleDelegator is realised when the two are used together. Below is a comparison of Mocha versus MiniTest::Mock and SimpleDelegator.

{% highlight ruby %}
# Mocha
test "POST create" do
  mock_order = Order.new
  mock_order.expects(:items).returns(Item.new)
  controller.order = mock_order
  post :create, :format => 'json'
  # ...
end

# MiniTest::Mock and SimpleDelegator
test "POST create" do
  mock_order = Class.new SimpleDelegator do
    def items
      mock = MiniTest::Mock.new
      mock.expect :create, Item.new, [Hash]
    end
  end
  controller.order = mock_order.new(Order.new)
  post :create, :format => 'json'
  # ...
end
{% endhighlight %}

MiniTest::Mock and SimpleDelegator are more verbose than Mocha but I like that it uses the standard library and doesn't introduce new methods on Object, Module or Class. In addition MiniTest::Mock and SimpleDelegator are faster than Mocha. The [benchmark is available as a gist](https://gist.github.com/1755458).

{% highlight text %}
                  user       system     total      real
mocha:            0.000000   0.000000   0.000000   (0.000226)
simple_delegator: 0.000000   0.000000   0.000000   (0.000016)
{% endhighlight %}
