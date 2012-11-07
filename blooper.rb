#!/usr/bin/env ruby
# encoding: utf-8

$:.unshift File.dirname(__FILE__) + '/lib'

require "ap"
require "get_input.rb"
require "rows.rb"

require "pg"
require "active_record"

dbconfig = YAML::load(File.open('database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

line = GetInput.new.detect
ap Rows.new(line).rows
