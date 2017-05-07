require 'rubygems'
require 'bundler'

Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)

require 'dotenv/load'
require './app/server'

run GifMessenger
