ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/users/sign_in'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end


  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    array = (params[:tags]).split(" ")
    array.map do |name|
      link.tags << Tag.create(name: name)
    end
    link.save
    redirect to('/links')
  end

  get '/users/sign_in' do
    erb :'users/sign_in'
  end

  post '/users/welcome_user' do
    @user = User.create(name: params[:name], email: params[:email],
      password: params[:password])
    redirect to('/users/welcome_user')
  end

  get '/users/welcome_user' do
    erb(:'users/welcome_user')
  end


end
