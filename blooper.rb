#!/usr/local/bin/ruby
# encoding: utf-8

cwd = File.dirname(__FILE__)

ENV['BUNDLE_GEMFILE'] ||= cwd + '/Gemfile'
require "bundler"
Bundler.require

$:.unshift cwd
require "lib/database.rb"
require "lib/input.rb"
require "lib/rows.rb"
require "model/access.rb"

Database.connect

Input.new(STDIN).each do |rows|
  rows.save
end
