require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/links' do
    erb(:links)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
