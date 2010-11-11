module Jekyll
  # Displays a notification before and after the build process.
  class GrowlGenerator < Generator
    def initialize(config = {})
      require 'growl'
    rescue LoadError
      STDERR.puts 'You are missing a library required for growl. Please run:'
      STDERR.puts '  $ [sudo] gem install growl'
      raise FatalException.new('Missing dependency: growl')
    end
    
    def generate(site); end
  end  
  
  class Site
    alias :process_without_growl :process
    
    def process
      Growl.notify 'Building...', :title => 'Jekyll'
      process_without_growl
      Growl.notify 'Build complete', :title => 'Jekyll'
    end    
  end
end
