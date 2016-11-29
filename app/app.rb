require 'sinatra/base'
require './app/models/link.rb'
require 'data_mapper'


class App < Sinatra::Base

  get '/links' do
    @links = Link.all
    #require 'pry'; binding.pry
    erb :links
  end

  run! if app_file == $0
end
