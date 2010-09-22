module Jekyll
  
  class GrowlHook < Hook
    def initialize(config = {})
      require 'growl'
    rescue LoadError
      STDERR.puts 'You are missing a library required for growl. Please run:'
      STDERR.puts '  $ [sudo] gem install growl'
      raise FatalException.new('Missing dependency: growl')
    end
    
    def pre(site)
      Growl.notify 'Building...', :title => 'Jekyll'
    end
    
    def post(site)
      Growl.notify 'Build complete', :title => 'Jekyll'
    end
  end
  
end
