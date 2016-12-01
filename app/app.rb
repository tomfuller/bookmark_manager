ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/index'
  end

  get '/links' do
    @username = session[:username]
    @links = Link.all
    erb :'links/index'
  end

  post '/signup' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    User.create(username: params[:username], password: params[:password])
    redirect '/links'
  end

  get '/links/new' do
    @message = ''
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url],
    title: params[:title])
    tag_input = params[:tag].split(",").collect { |tag| tag.lstrip.rstrip }

    tag_input.each do |tag|
      new_tag = Tag.first_or_create(name: tag)
      link.tags << new_tag
    end
    link.save
    redirect '/links'
  end

  get '/tags' do
    @tags = Tag.all
    erb :'tags/index'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
