ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  get '/links' do
    @username = session[:username]
    @links = Link.all
    erb :'links/index'
  end

  post '/user' do
    @user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
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

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
