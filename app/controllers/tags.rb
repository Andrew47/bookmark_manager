class BookmarkManager < Sinatra::Base
  get '/tags' do
    redirect "/tags/#{params[:name]}"
  end
  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end
end
