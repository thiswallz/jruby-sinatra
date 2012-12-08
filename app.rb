require 'rubygems'
require 'sinatra'
require 'json/pure'
 
get '/' do
  "Hello world from Sinatra running on Java! at #{Time.now.to_s} and some JSON encoding " + {:name => 'brian', :hobbies =>['skiing', 'mtb riding', 'tennis']}.to_json
end