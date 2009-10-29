# Adopted from Scott Kyle's Rakefile
# http://github.com/appden/appden.github.com/blob/master/Rakefile

def jekyll(opts = '')
  sh 'rm -rf _site'
  sh 'jekyll ' + opts
end
 
desc 'Build site using Jekyll'
task :build do
  jekyll
end
 
desc 'Start server on http://localhost:4000'
task :server do
  jekyll('--server --auto')
end

desc 'Deploy to production'
task :deploy do
  sh 'rsync -rtzh --progress --delete _site/ tatey@tatey.com:~/var/www/tatey.com/'
end
