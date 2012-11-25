#!/usr/local/bin/ruby
# encoding: utf-8

require "bundler/setup"
Bundler.require

cwd = File.dirname(__FILE__)
$:.unshift cwd

require "lib/database.rb"
require "lib/input.rb"
require "lib/rows.rb"
require "model/access.rb"

 Input.new(STDIN).each do |rows|
  rows.save
end
