#!/usr/bin/env ruby
require "pathname"
require "fileutils"
include FileUtils

# path to your application root.
APP_ROOT = Pathname.new File.expand_path("..", __dir__)

def system!(*args)
  system(*args) || abort("\n== Command #{args} failed ==")
end

chdir APP_ROOT do
  puts "== STARTING UP =="
  system! "RAILS_ENV=local_production foreman start -f Procfile.local_prod"
end
