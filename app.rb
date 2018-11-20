require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks/new' do
    Bookmark.add(params[:title], params[:url])
    redirect '/bookmarks'
  end

  post '/bookmarks/delete' do
    Bookmark.remove(params[:delete]) 
    redirect '/bookmarks'
  end

  post '/bookmarks/update' do
    Bookmark.hold(params[:update]) 
    redirect '/update'   
  end

  get '/update' do
      @record = Bookmark.record_details
      erb(:update)
  end

  post '/update/perform_update' do
    Bookmark.update(params[:title], params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end