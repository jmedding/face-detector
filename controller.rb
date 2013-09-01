#require 'rubygems'
require 'daemons'



Daemons.run('app.rb')

#pwd = Dir.pwd
#Daemons.run_proc('app.rb', {:dir_mode =&gt; :normal, :dir =&gt; "/opt/pids/sinatra" } ) do
#  Dir.chdir(pwd)
#  exec "ruby app.rb"
#end

