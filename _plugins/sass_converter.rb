module Jekyll

  class SassConverter < Converter
    def setup
      return if @setup
      require 'sass'
      @setup = true
    rescue LoadError
      STDERR.puts 'You are missing a library required for sass. Please run:'
      STDERR.puts '  $ [sudo] gem install haml'
      raise FatalException.new("Missing dependency: haml")
    end

    def matches(ext)
      ext =~ /sass/i
    end

    def output_ext(ext)
      '.css'
    end

    def convert(content)
      setup
      Sass::Engine.new(content, :syntax => :sass).render
    end
  end

end
