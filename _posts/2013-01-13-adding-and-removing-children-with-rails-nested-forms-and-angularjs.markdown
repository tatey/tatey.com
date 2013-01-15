---
layout: post
title: Adding and Removing Children with Rails Nested Forms and AngularJS
---

[AngularJS](http://angularjs.org) had appeared on my radar before, but I wasn't inspired to try it until I read [Click to Edit with AngularJS](http://icelab.com.au/articles/click-to-edit-with-angularjs/) by Tim Riley. AngularJS takes a different approach to enhancing pages. Instead of thinking about DOM manipulation, you think about data and bindings.

We have a project at work that has nested forms. You can add and remove children before saving the entire object graph. We also have a rule where you cannot remove a child if there is only one child. When you're thinking about DOM manipulation, you think about adding your event listeners, cloning the element, changing its attributes and inserting it back into the DOM. In contrast, when you think about data and bindings, all you need to think is "I want another child object".

I'll start by giving context, and then break everything down line by line. Starting with the Rails model, we have a plan that accepts nested attributes for polls.

{% highlight ruby %}
# app/models/plan.rb
class Plan < ActiveRecord::Base
  has_many :polls

  accepts_nested_attributes_for :polls
end
{% endhighlight %}

In the Rails controller we setup a default poll.

{% highlight ruby %}
# app/controllers/plans_controller.rb
class PlansController < ApplicationController
  def new
    @plan = Plan.new
    @plan.polls.build title: 'Time'
  end
end
{% endhighlight %}

Then we write the view.

{% highlight erb %}
{% raw %}
<!-- app/views/new.html.erb -->
<div ng-app>
  <%= form_for @plan do |form| %>
    <div ng-controller="PollCtrl" ng-init="polls = <%= @plan.polls.to_json %>">
      <div ng-repeat="poll in polls">
        <%= form.fields_for :polls, Poll.new, child_index: '{{$index}}' do |poll_form| %>
          <%= poll_form.text_field :title, id: 'plan_poll_{{$index}}', value: '{{poll.title}}' %>
        <% end %>
        <a href="#" ng-click="remove($index)" ng-show="isRemovable()">Remove</a>
      </div>
      <a href="#" ng-click="add()">Add</a>
    </div>
  <% end %>
</div>
{% endraw %}
{% endhighlight %}

And the AngularJS controller.

{% highlight javascript %}
// app/assets/javascripts/plans.js
function PollCtrl($scope) {
  $scope.isRemovable = function() {
    return $scope.polls.length > 1;
  };

  $scope.add = function() {
    $scope.polls.push({});
  };

  $scope.remove = function(index) {
    $scope.polls.splice(index, 1);
  };
}
{% endhighlight %}

You really need to [try this jsfiddle to see it in action](http://jsfiddle.net/tatejohnson/vLhNb/).

### View and AngularJS Controller Line by Line

The AngularJS controller is associated with `PollCtrl`. `PollCtrl` is our wrapper around `$scope` for handling the bindings we declare in the view. The AngularJS controller is intialized with the Rails model objects that were setup in the Rails controller earlier. As a side-effect, these will be the same Rails model objects we'd get back from a failed POST to the create action.

{% highlight erb %}
<div ng-controller="PollCtrl" ng-init="polls = <%= @plan.polls.to_json %>">
{% endhighlight %}

Next, we want the input and remove anchor elements repeated for each poll JavaScript object.

{% highlight erb %}
<div ng-repeat="poll in polls">
  <!-- ... -->
</div>
{% endhighlight %}

Using `fields_for` we instantiate a poll Ruby object to give us access to the nested form builder. We want AngularJS to manage the indexes for us, so instead of specifying an explicit index, we're going to set the index of the input element to a special variable available within the scope of repeating elements. As a side-effect of using `child_index`, it is necessary to specify the ID of the input element to avoid ID collisions in the DOM. If you don't care, then you could safely omit the ID *(Thanks to [Darcy Laycock](https://twitter.com/Sutto/status/290318902750216192) for the suggestion to use `child_index`)*.

{% highlight erb %}
{% raw %}
<%= form.fields_for :polls, Poll.new, child_index: '{{$index}}' do |poll_form| %>
  <%= poll_form.text_field :title, id: 'plan_poll_{{$index}}', value: '{{poll.title}}' %>
<% end %>
{% endraw %}
{% endhighlight %}

These two anchors are bound to the add and remove functions in our AngularJS controller. The `ng-show` attribute tells AngularJS to show this anchor when our AngularJS's controller `isRemovable` function returns true.

{% highlight erb %}
<a href="#" ng-click="remove($index)" ng-show="isRemovable()">Remove</a>
<a href="#" ng-click="add()">Add</a>
{% endhighlight %}

Expanding on the `isRemovable` function, a poll is only removable if there is more than one of them.

{% highlight javascript %}
$scope.isRemovable = function() {
  return $scope.polls.length > 1;
};
{% endhighlight %}

Add inserts an empty object, and remove deletes an object at the given index.

{% highlight javascript %}
$scope.add = function() {
  $scope.polls.push({});
};

$scope.remove = function(index) {
  $scope.polls.splice(index, 1);
};
{% endhighlight %}

The index came from the special index variable available inside the scope of repeating elements.

{% highlight erb %}
<a href="#" ng-click="remove($index)" ng-show="isRemovable()">Remove</a>
{% endhighlight %}

### Rails Nested Forms

Some people might be surprised at my use of nested forms. Nested forms can suck, and when they do its time to consider something else like an [intermediary view object](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/). But until you reach that point, nested forms are the quickest way to ship.
