# app.rb
require 'sinatra'
require './models/formula1_news_getter'

get '/' do
  news_getter = Formula1NewsGetter.new
  @articles = news_getter.articles
  erb :index
end
