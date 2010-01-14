---
layout: post
title: Why I like Enumerable#inject
---

Recently I've been helping a friend learn Ruby. Digging around first year university assignments, I stumbled on a method definition for calculating the annual interest on a bank balance that's compounded monthly.

The original implementation was in Java, which you could imagine would be more verbose. 

{% highlight ruby %}
def calculate_interest(rate)
  monthly_balance = @balance
  interest = 0
  12.times do
    monthly_interest = monthly_balance * rate
    interest = interest + monthly_interest
    monthly_balance = monthly_balance + monthly_interest
  end
  interest
end
{% endhighlight %}

Look at all those variables. Yuck. I would never write code like this today. Accumulation is a perfect candidate for `Enumerable#inject`.

{% highlight ruby %}
def calculate_interest(rate)
  balance_plus_interest = 12.times.inject(@balance) do |balance, m| 
    balance += balance * rate
  end
  balance_plus_interest - @balance
end
{% endhighlight %}

Storing the result is unnecessary. 

{% highlight ruby %}
def calculate_interest(rate)
  12.times.inject(@balance) { |b, m| b += b * rate } - @balance
end
{% endhighlight %}

Although unnecessary, I'd argue it may lead to less readable code. 

Lastly, while you're not prevented from chaining method invocations to the `end` keyword, it doesn't feel right. That said, I'm open to change. 

{% highlight ruby %}
def calculate_interest(rate)
  12.times.inject(@balance) do |balance, m| 
    balance += balance * rate
  end - @balance
end
{% endhighlight %}

