#!/usr/bin/env ruby
require 'yaml'
f = YAML.load_file("docker-compose.yml")

web_container = (f['services'].key? 'web') ? 'web' : f['services'].keys[0]

p "Going into #{web_container}:"

exec = ""
if ARGV.empty?
  exec = "console"
else 
  ARGV.each do|a|
    exec << a << " "
  end
end

system("docker-compose exec #{web_container} bin/rails #{exec}") 
