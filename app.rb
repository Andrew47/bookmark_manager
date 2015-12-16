require 'sinatra/base'
require_relative 'data_mapper_setup'

  ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :'links/index'
  end


  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end



end
