---
layout: post
title: Putting the V in MVC for HTTP APIs built on Rails
---

Rails encourages you to leave the view out when building a HTTP API. This works great as long as the interface that's exposed matches the underlying schema. As soon as these diverge it becomes necessary to modify the model or controller to maintain compatibility with the interface. 

Applications may start out with defining `#as_json` and `#to_xml` in their models in an attempt to keep their controllers skinny. Eventually the model is exposed through multiple resources because of nesting or versioning. The same model is expected to behave differently between interfaces. At this point you have a choice of managing this behaviour in the controller or creating proxy classes and defining `#as_json` or `#to_xml` there. 

Now you're defining views in two places. Your HTML views live in `/app/views` and your JSON and XML views live in `/app/models`. You're using functional and integration tests for your HTML views and unit tests for your JSON and XML views. Why are we treating these views differently?

At this point you decide to investigate one of the many builder-style libraries. All of them have some sort of DSL for what is ultimately building arrays and hashes and none of them do both XML, JSON and JSONP. Frustrated at the unnecessary complexity I created [Porth](https://github.com/tatey/porth) (Plain Old Ruby Template Handler) for Rails. Write your views using plain old Ruby. There's no need to learn a DSL for building arrays and hashes. Just use Ruby. Views are written once and rendered in JSON(P) or XML based on the requested format.

[UPDATE 2022-02-01: I consider [jbuilder](https://github.com/rails/jbuilder) to be the successor to Porth. Yes, it's a DSL, but you write at the view layer which was the best insight I got from creating Porth]
