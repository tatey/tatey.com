---
layout: post
title: MiniTest::Mock + SimpleDelegator = SimpleMock.
published: false
---

[SimpleMock](http://github.com/tatey/simple_mock) is a fast, powerfully tiny mocking library for Ruby 1.9.2 or greater. Under the hood it uses [MiniTest::Mock](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/minitest/mock/rdoc/MiniTest/Mock.html) and [SimpleDelegator](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/delegate/rdoc/SimpleDelegator.html) to mix classical mocking with real objects. An idea born out of an [earlier blog post](http://tatey.com/2012/02/07/mocking-with-minitest-mock-and-simple-delegator/) and later captured in [these](https://twitter.com/#!/tatejohnson/status/167215752036888577) [tweets](https://twitter.com/#!/tatejohnson/status/167591787937017856).

Where [other libraries](http://mocha.rubyforge.org/) temporarily replaces methods on objects, SimpleMock never mutates its delegate leaving objects completely untainted. SimpleMock is isolated in its own namespace and can be safely required in any Ruby project. SimpleMock depends only on the standard library and plays nicely with MiniTest and RSpec. The library code with whitespace is a tiny 81 lines. [Parts](https://github.com/tatey/simple_mock/blob/v0.0.1/test/unit/mock_delegator_test.rb#L56) of the library are tested against itself. The API it exposes is 100% compatible with MiniTest::Mock so there is nothing new to learn.

## When to use SimpleMock

Changing the behaviour of real objects should be a last resort. If you find yourself needing to regularly set expectations on real objects it may indicate that code is too tightly coupled. However, there are use cases where this cannot be avoided.

Rails route helpers are one of those use cases. Rails uses introspection to build routes from model objects. That means less code is written in controllers, but testing controllers in isolation is difficult. You may start off mocking dependancies, but you'll quickly end up with a test that has lots of setup. Not to mention your making assumptions about the interfaces of objects out of your control. In such a scenario is makes sense to set expectations on a real model object for the duration of the test.

In the comparison below SimpleMock and Mocha are the same number of lines of code.

{% highlight ruby %}
# Mocha
test "POST create" do
  mock_items = mock()
  mock_items.expects(:create).with(Hash).returns(Item.new)
  mock_order = Order.new
  mock_order.expects(:items).returns(mock_items)
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

# SimpleMock
test "POST create" do
  mock_items = SimpleMock.new
  mock_items.expect :create, Item.new, [Hash]
  mock_order = SimpleMock.new Order.new
  mock_order.expect :items, mock_items
  controller.order = mock_order
  post :create, :format => 'json'
  # ...
end
{% endhighlight %}

## Fast tests are fast

SimpleMock is fast. While it may have a higher overhead than using MiniTest::Mock with SimpleDelegator you get the benefit of a familiar and consistent API. In [this benchmark](https://gist.github.com/1871840) we create an array, set an expectation and call the method 10,000 times.

{% highlight text %}
                  user       system     total      real
mocha:            0.000000   0.000000   0.000000   (0.000279)
simple_delegator: 0.000000   0.000000   0.000000   (0.000029)
simple_mock:      0.000000   0.000000   0.000000   (0.000057)
{% endhighlight %}

SimpleMock is available as a [gem](http://rubygems.org/gems/simple_mock). Try SimpleMock in your next project and let me know what you think.
