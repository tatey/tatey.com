---
layout: post
title: Layouts with Smarty
---

[Smarty](http://smarty.net/) doesn't appear to support layouts, an incredibly useful concept for separating reusable markup in views.

Documentation has an [example](http://smarty.net/manual/en/language.function.include.php) using the {include} tags for including a header and footer template in to each of your views. I think this approach is repetitive and not as flexible as it ought to be.

My expectations:

* Single function
* Specify view
* Specify layout or fallback to default

Fortunately, there is a [fetch()](http://smarty.net/manual/en/api.fetch.php) function that returns the template output as a string. Taking the earlier example of the header and footer, I wrote a simple wrapper function to do this for me.

{% highlight php5 %}
<?php
// includes/controllers/base_controller.php
require('Smarty.class.php');

public function __construct()
{
  $this->smarty = new Smarty();
}

public function render_layout($view, $layout = 'application')
{
  echo(
    $this->smarty->fetch('layouts/' . $layout . '/header.tpl') .
    $this->smarty->fetch($view) .
    $this->smarty->fetch('layouts/' . $layout . '/footer.tpl')
  );
}
{% endhighlight %}

{% highlight php5 %}
<?php
// includes/controllers/items_controller.php
public function show()
{
  $this->smarty->assign_by_ref('item', Item::find_by_id($this->params['id']));
  $this->render_layout('items/show');
}
{% endhighlight %}

While it's no where near as nice as [layouts in Rails](http://guides.rubyonrails.org/layouts_and_rendering.html), it is a small amount of effort for greater flexibility in your views with Smarty.