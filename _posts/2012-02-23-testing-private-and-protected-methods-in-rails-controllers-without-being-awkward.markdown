---
layout: post
title: Testing Private and Protected Methods in Rails Controllers Without Being Awkward
---

In Rails, it's considered best practice to mark non-action methods as private or protected. This is because Rails will never route HTTP requests to methods which cannot be called publicly. This practice encourages us to hide important behaviour in methods which are not easily tested. There are many awkward techniques such as [chaining `instance_eval` and `send`](http://stackoverflow.com/questions/4271696/rspec-rails-how-to-test-private-methods-of-controllers), [creating an anonymous subclass and drawing a route](https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs/anonymous-controller), a slow integration test or [omitting the test altogether](http://stackoverflow.com/questions/7607419/how-to-write-rspec-for-private-method-in-controller-with-params). None of these test the desired behaviour in an intention revealing way. Nor would they be considered acceptable if it were any other class.

Testing doesn't have to be awkward. It can be greatly simplified if we think about it slightly differently. The idea isn't radical. It's to move hidden behaviour into distinct classes which are then invoked privately from inside the controller. A distinct class with a single responsibility becomes easier to reason with. Easier to test. Invoking it privately means we'll never accidentally route HTTP requests to non-action methods.

Lets start with a typical controller. This controller has been extracted from a code base that I recently refactored. `AdminController` is an abstract controller that gets subclassed by any controller in the admin section of the website. Authorization is common behaviour shared between all controllers. On each request, we check that the member is an admin. If the member is not an admin we return a 403 and stop them from viewing the page. Authorization is critical behaviour that must be correct. We could never let a member who isn't an admin have privileged access.

{% highlight ruby %}
# app/controllers/admin_controller.rb
class AdminController < ActionController::Base
  before_filter :authorize_member!

protected

  def authorize_member!
    unless current_member.admin_role?
      render text: '403: Forbidden', status: :forbidden
      false
    end
  end
end
{% endhighlight %}

Your fire up the server and everything is working great. But how do you have confidence that you're not going to suffer from a regression in the future? If a regression does occur, how do you quickly pin point where it went wrong? Moreover, as our authorization scheme grows in complexity it becomes increasingly difficult to reason with in the context of hidden behaviour.

Lets move the behaviour into a new class called `AuthorizeMember` and nest it underneath `AdminController`. We could organise it into its own file, but it's such a small class and only makes sense in the context of `AdminController`. `AuthorizeMember` is comprised of a single, stateless class method `authorize!` which takes two arguments. The member who is authenticated and the controller where the request orignated from. It might seem strange to pass around a controller. As magical as controllers are, they're still objects which respond to methods making them no different to passing around a hash or an array. Finally, we delegate our controller's protected method to `AuthorizeMember.authorize_member!`.

{% highlight ruby %}
# app/controllers/admin_controller.rb
class AdminController < ActionController::Base
  class AuthorizeMember
    def self.authorize! member, controller
      unless member.admin_role?
        controller.render text: '403: Forbidden', status: :forbidden
        false
      end
    end
  end

  before_filter :authorize_member!

protected

  def authorize_member!
    AuthorizeMember.authorize! current_member, self
  end
end
{% endhighlight %}

The end result is identical, but now it exists in a distinct class where collaborators are injected. Injecting collaborators frees us from the constraints of their implementation. Instead of depending on an instance of `ActionController::Base`, we now depend on an object that responds to `render`. The difference is small, but the impact is massive. With only a handful of lines we can write a focused, intention revealing test that runs fast in isolation. `ActionController::Base` is really well tested, so there is no need for us to double up on that.

{% highlight ruby %}
# spec/controllers/admin_controller_spec.rb
require 'spec_helper'

class MockController
  attr_reader :last_options

  def initialize
    @last_options = {}
  end

  def render options
    @last_options = options
  end
end

describe AdminController do
  describe 'AuthorizeMember.authorize' do
    it 'is forbidden' do
      member     = OpenStruct.new admin_role?: false
      controller = MockController.new
      AdminController::AuthorizeMember.authorize! member, controller
      controller.last_options.should_not be_empty
      controller.last_options[:text].should include('403')
      controller.last_options[:status].should eq(:forbidden)
    end

    it 'does nothing' do
      member     = OpenStruct.new admin_role?: true
      controller = MockController.new
      AdminController::AuthorizeMember.authorize! member, controller
      controller.last_options.should be_empty
    end
  end
end
{% endhighlight %}

The thing I love most about this technique is that you already know it. You practice it every time you refactor a big piece of code into smaller pieces of code. By thinking about controllers as something less magical, and something more like any other ruby class, you enable yourself to reuse your existing knowledge. There's no special rules like calling `instance_eval` or additional libraries like RSpec's anonymous controller. Instead, we write distinct classes focused on a single piece of behaviour that we delegate to from hidden methods in our controllers. Testing private and protected methods in Rails controllers doesn't have to be awkward. We can write plain old Ruby and keep things simple.
