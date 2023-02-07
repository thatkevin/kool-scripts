#!/usr/bin/env ruby
require 'yaml'
f = YAML.load_file("docker-compose.yml")
first_container = f['services'].keys[0]
p "Going into #{first_container}:"

exec = ""
if ARGV.empty?
  exec = "sh"
else 
  ARGV.each do|a|
    exec << a << " "
  end
end

system("docker-compose exec #{first_container} #{exec}") 
