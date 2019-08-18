require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'htmlentities'

require File.expand_path '../app.rb', __FILE__

run Sinatra::Application

