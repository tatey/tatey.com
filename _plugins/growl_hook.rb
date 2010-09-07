module Jekyll
  
  class GrowlHook < Hook
    def setup
      return if @setup
      require 'growl'
      @setup = true
    rescue LoadError
      STDERR.puts 'You are missing a library required for growl. Please run:'
      STDERR.puts '  $ [sudo] gem install growl'
      raise FatalException.new('Missing dependency: growl')
    end
    
    def pre(site)
      setup
      Growl.notify 'Building...', :title => 'Jekyll'
    end
    
    def post(site)
      setup
      Growl.notify 'Build complete', :title => 'Jekyll'
    end
  end
  
end
