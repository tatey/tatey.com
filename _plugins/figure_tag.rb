module Jekyll
  class FigureTag < Liquid::Tag
    VALID = %[src href caption].freeze
        
    def initialize(tag_name, args, tokens)
      super 
      @args = args.split(', ').inject({}) do |args, arg|
        if arg.strip =~ /^([^:]+):\s(.+)$/ && VALID.include?($1)
          args[$1] = $2.gsub('&comma;', ',')
          args
        else
          raise SyntaxError.new("Syntax Error in 'figure' - Invalid argument")
        end
      end
      if !@args.has_key?('src')
        raise SyntaxError.new("Syntax Error in 'figure' - Missing src")
      end
    end
    
    def render(context)
      case
      when @args['caption'] && @args['href']
<<-HTML
<figure>
  <a href="#{@args['href']}"><img src="#{@args['src']}" alt=""></a>
  <figcaption>#{@args['caption']}</figcaption>
</figure>
HTML
      when @args['caption']
<<-HTML
<figure>
  <img src="#{@args['src']}" alt="">
  <figcaption>#{@args['caption']}</figcaption>
</figure>
HTML
      when @args['href']
<<-HTML
<a href="#{@args['href']}"><img class="single" src="#{@args['src']}" alt=""></a>
HTML
      else
<<-HTML
<img class="single" src="#{@args['src']}" alt="">
HTML
      end
    end
  end
  
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)
