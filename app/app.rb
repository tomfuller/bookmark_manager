ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    @message = ''
    erb(:'links/new')
  end

  post '/links' do
    link = Link.new(url: params[:url],
                    title: params[:title])
    tag = Tag.first_or_create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/tags' do
    @tags = Tag.all
    erb(:'tags/index')
  end

  get 'tags/:name' do
    p params
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
