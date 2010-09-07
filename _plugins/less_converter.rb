module Jekyll

  class LessConverter < Converter
    safe true

    def setup
      return if @setup
      require 'less'
      @setup = true
    rescue LoadError
      STDERR.puts 'You are missing a library required for less. Please run:'
      STDERR.puts '  $ [sudo] gem install less'
      raise FatalException.new("Missing dependency: less")
    end

    def matches(ext)
      ext =~ /less/i
    end

    def output_ext(ext)
      ".css"
    end

    def convert(content)
      setup
      Less::Engine.new(content).to_css
    end
  end

end
