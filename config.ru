require 'rubygems'
require 'bundler'

Bundler.require

ENV['RACK_ENV'] = 'development' unless ENV['RACK_ENV']

require 'dotenv/load'
require './server'

run GifMessenger
