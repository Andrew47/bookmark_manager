ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'sinatra/partial'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret , 'super secret'
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  get '/' do
    redirect '/users/new'
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

  get '/users/new' do
    erb :'users/sign_in'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect to('/links')
      else
        flash.now[:errors] = @user.errors
        erb :'users/sign_in'
      end
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/links')
    else
      flash.now[:errors] = [['The email or password is incorrect']]
      erb :'users/sign_in'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/users/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


end
