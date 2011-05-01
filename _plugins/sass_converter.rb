module Jekyll
  # Compiled Sass into CSS. You must specify an empty YAML front matter
  # at the beginning of the file.
  # sass|sccs -> .css
  class SassConverter < Converter    
    def setup
      return if @setup
      require 'sass'
      @setup = true
    rescue LoadError
      STDERR.puts 'You are missing a library required for sass. Please run:'
      STDERR.puts '  $ [sudo] gem install sass'
      raise FatalException.new("Missing dependency: sass")
    end

    def matches(ext)
      ext =~ /sass|scss/i
    end

    def output_ext(ext)
      '.css'
    end

    def convert(content)
      setup
      begin
        Sass::Engine.new(content, :style => :compressed, :syntax => syntax(content)).render
      rescue => e
        puts "Sass Exception (#{e.sass_line}): #{e.message}"
      end
    end
    
  private
    
    def syntax(content)
      content.include?(';') ? :scss : :sass
    end
  end
end
