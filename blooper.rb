#!/usr/local/bin/ruby
# encoding: utf-8

require "rubygems"
require "bundler/setup"

require "pg"
require "active_record"


cwd = File.dirname(__FILE__)
$:.unshift cwd
dbcfg = YAML::load(File.open(cwd + '/database.yml'))

require "lib/input.rb"
require "lib/rows.rb"
require "model/access.rb"

ActiveRecord::Base.establish_connection(dbconfig)

Input.new(STDIN).each do |rows|
  rows.save
end
