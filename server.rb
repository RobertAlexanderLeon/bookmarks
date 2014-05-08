require 'sinatra'
require 'data_mapper'
require './lib/link'


env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do
  @links = Link.all
  erb :index
end