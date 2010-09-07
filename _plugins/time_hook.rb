module Jekyll
  
  # Specify a post's time in the YAML front matter. An in-hook
  # guarantees we'll have all the post data before rendering the payload.
  class TimeHook < Hook
    safe true
    
    def in(site)
      site.posts.each do |post|
        if post.data.has_key?('time')
          post.date = Time.parse("#{post.date.strftime('%Y-%m-%d')} #{post.data['time']}")
        end
      end
    end
  end
  
end
