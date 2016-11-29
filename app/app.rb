require 'sinatra/base'
require './app/models/link.rb'
require 'data_mapper'


class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect('/links')
  end



  run! if app_file == $0
end
