require 'fileutils'

module Jekyll
  
  class CleanHook < Hook
    def pre(site)
      FileUtils.rm_r(site.dest, :force => true) if File.directory?(site.dest)
    end
  end
  
end
