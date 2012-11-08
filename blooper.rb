#!/usr/local/bin/ruby
# encoding: utf-8

$:.unshift File.dirname(__FILE__)

require "pg"
require "active_record"

require "lib/input.rb"
require "lib/rows.rb"
require "model/access.rb"

dbconfig = YAML::load(File.open(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

Input.new(STDIN).each do |rows|
  rows.save
end
