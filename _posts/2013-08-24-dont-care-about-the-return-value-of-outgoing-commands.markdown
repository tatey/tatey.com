---
layout: post
title: Don't Care About the Return Value of Outgoing Commands
---

When writing unit tests we set [expectations that outgoing commands will be sent](https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf). We verify that the command was sent, but we don't care about the return value. Testing libraries like RSpec force you to specify a return value when using the short-hand syntax.

{% highlight ruby %}
logger = double 'Logger', info: 'Message'
logger.info 'Message'

expect(logger).to have_received(:info).with('Message')
{% endhighlight %}

That innocent looking return value is an assumption being made about an object that our unit test doesn't own. It's susceptible to API drift and is a distraction from the test at hand. Instead of making an assumption, lets be explicit and say that we don't care.

{% highlight ruby %}
logger = double 'Logger', info: dont_care
logger.info 'Message'

expect(logger).to have_received(:info).with('Message')
{% endhighlight %}

By being explicit we're giving a clue to the next programmer that the return value doesn't matter. We don't do anything with the return value and `Logger` has its own suite of unit tests which verify the behaviour of the `info` method. Our implementation of `dont_care` is simple.

{% highlight ruby %}
# spec/support/dont_care.rb
module Support
  module DontCare
    def dont_care
        nil
      end
    end
  end

  RSpec.configure do |c|
    c.include Support::DontCare
  end
end
{% endhighlight %}

It doesn't matter that we return `nil`. It's used only for outgoing commands and we never do anything with the return value. When you put it all together you end up with small, readable unit tests that look like this.

{% highlight ruby %}
# spec/interactors/task/restart_process_spec.rb
describe Task::RestartProcesses do
  describe '#run_with_error' do
    let(:client) { double 'HerokuClient', post_ps_restart: dont_care }
    let(:logger) { double 'Logger', info: dont_care }
    let(:task)   { Task::RestartProcesses.new logger: logger }

    before do
      # Inject Dependencies
      task.client = client

      # Run
      task.run_with_error
    end

    it 'restarts processes' do
      expect(client).to have_received(:post_ps_restart)
    end

    it 'logs' do
      expect(logger).to have_received(:info).with('Restarting processes')
    end
  end
end
{% endhighlight %}
