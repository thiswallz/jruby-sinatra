require 'fileutils'
require 'open-uri'
include FileUtils

APPENGINE_JAVA_SDK_BASE="/opt/appengine-java-sdk-1.7.3"
APP_URL = "http://localhost"

LOCAL_APP_PORT="9091"
LOCAL_APP_URL="http://localhost:#{LOCAL_APP_PORT}"

task :run => [:build] do
  Thread.new do
    
    while true
  
      begin
        puts "pinging #{LOCAL_APP_URL}"
        open(LOCAL_APP_URL)
        sh %{open #{LOCAL_APP_URL}}
        break
      rescue
      end
      sleep 1
    end
  
  end
  
  sh %{#{APPENGINE_JAVA_SDK_BASE}/bin/dev_appserver.sh --address=0.0.0.0 --port=#{LOCAL_APP_PORT} tmp/war/}
end

task :deploy => [:build] do  
  sh %{#{APPENGINE_JAVA_SDK_BASE}/bin/appcfg.sh update tmp/war/}
  sh %{open #{APP_URL}}
end

task :build => [:clean, :package, :patch_sinatra] do

end

task :package => [] do
    sh %{jruby -S warble}
end

task :patch_sinatra do
  path = "tmp/war/WEB-INF/gems/gems/sinatra-1.3.3/lib/sinatra.rb"
  lines = File.open(path, "r").readlines.collect{|l| (l.index("use_in_file_templates") != nil) ? "# #{l}" : l }
  File.open(path, "w") { |f| f.write(lines.join) }
end

task :clean do
  sh %{jruby -S warble war:clean}
  rm_f "jruby-sinatra-app.war"
end
