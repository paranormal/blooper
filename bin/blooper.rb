#!/usr/local/bin/ruby
# encoding: utf-8

require 'pathname'
path = Pathname.new(File.dirname(File.expand_path(__FILE__)))

ENV['BUNDLE_GEMFILE'] ||= (path.parent.join('Gemfile').to_path)
require "bundler"
Bundler.require(:default)

$:.unshift(path.parent.join('lib'))
require "database.rb"
require "input.rb"
require "line.rb"
require "rows.rb"
require "model/access.rb"

Database.connect

Input.new(STDIN).each do |rows|
  rows.save
end
