---
title: Mental model of Hill Charts
layout: post
---

Hill charts are a simple way to see how a project is *really* going. They [first appeared in Basecamp 3](https://m.signalvnoise.com/new-in-basecamp-see-where-projects-really-stand-with-the-hill-chart/), but I've seen them [used outside of Basecamp too](https://medium.com/@bryceyork/how-and-why-i-totally-reinvented-our-companys-project-status-reporting-method-9e2b9cfbf805). What I like most is how they signal where uncertainty exists. Lots of uncertainty early on is to be expected. Lots of uncertainty half way through is super risky.

When we decided to use hill charts I wanted to shortcut the philosophy of [Shape Up](https://basecamp.com/shapeup) into a quick reference. Inspired by the [mental model of dental hygiene](https://alok.github.io/2019/06/18/mental-model-of-dental-hygiene/) I wrote one for hill charts. With the help of my amazing colleagues we've adjusted it few times since then. Here we go:

# Dots are scopes

- Scopes reflect the meaningful parts of the problem that can be completed independently and in a short period of time — a few days or less. They are bigger than individual todos but much smaller than the whole project.
- A scope is one thing to design, engineer, and integrate together. It solves part a part of the problem and is represented as a todo list.

# Lifecycle of a scope

- Scopes on the left most side have not yet started, but have buy-in from everyone on the project team. Scopes on the right most side are completed. Scopes anywhere in-between are in-flight.
- Scopes are added during the *mapping*, or they're added when we're *doing the work*, or they're added by [splitting scopes](#splitting-scopes) into smaller scopes. Adding scopes is an important because it signals how much work we think is left.
- Scopes can be renamed. We rename scopes when the current name doesn't reflect the problem we're trying to solve. Clear naming is important because it signals our understanding of the goal.
- Scopes can be archived if we feel they've become irrelevant or our appetite has gone.
- Scopes can be trashed if we made a mistake

# Splitting scopes

- Scopes are split when we follow their [curious smells](#be-aware-of-curious-smells). Usually this means the old scope is too big, or we've been able to think about the problem in a different way.
- Split a scope by making a new todolist. Leave a comment that summarises the key decisions from the old scope and leave a link to the old scope too. This gives everyone context to understand the split.

# Figuring things out

- Scopes on the left hand side signal ambiguity and uncertainty. The only way to move them up the hill is to *do the work* and learn.
- This is where todos would look like research, wire framing, prototyping, scaffolding, and designing (To the extent that the design is figuring things out. Designing a bunch of assets probably lives in on the right hand side).
- Scopes move from the far left to the middle of the left hand side by figuring out how it should look and how it should be interacted with.
- Scopes move from the middle of the left hand side to the top of the hill by figuring out how it should be built. Figuring out could mean some programming to help you gain confidence.
- Scopes may oscillate between these two quartiles as they're being figured out, but [be aware of curious smells](#be-aware-of-curious-smells).

# At the top of the hill

- Scopes at the top of the hill mean we've figured it how it will work and how it will be built (e.g. Proof of concept, including programming). It doesn't mean that we've designed every pixel or that we've written every line of code. That's [making things happen](#making-things-happen).

# Making things happen

- Scopes on the right hand side signal confidence and clarity. The only way to move forward is to continue *doing the work* and polishing.
- This is where todos would look like high fidelity mock ups, integrating components, implementing all the edge cases, adding telemetry, polishing interactions, and tidying up.

# Check daily

- Ask yourself this question: Do you feel comfortable with what's in-flight for the amount of time you have left? If not, kick off a discussion with the team. Do we need to shift expectations? Do we need to do more hammering?
- Ask yourself this question: Do the other scopes look like what you'd expect? If not, dig further. Don't wait and leave it to chance. Talking to each other is building clarity.

# Update every 1-2 days

- Move scopes forward as we do and learn
- Move scopes backward as we discover rabbit holes, flawed assumptions, or other setbacks.
- Write a comment that names the scope and why you moved it. This gives everyone context to understand the change.

# Be aware of curious smells

- Scopes which oscillate forward and backward are a curious smell. Do we know what's expected? Are we working on a flawed assumption? Did we discover a rabbit hole? How can we solve this a different way?
- Scopes which take a long time to move are a curious smell. Is there a hidden scope? Are we trying to do too much? How can we solve this a different way?
- Projects which have many scopes on the far left hand side are a curious smell. Are we moving too fast? Are we focusing on imagined tasks over integration tasks? What's blocking us from completing other tasks first? How can we hone our focus?
- Projects which have many in-flight scopes are a curious smell. Are we doing too much? Is our focus too split? Do we need to archive scopes or move them to the chowder list? Is it a signalling problem?
