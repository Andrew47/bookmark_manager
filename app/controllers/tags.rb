class BookmarkManager < Sinatra::Base
  get '/tags/specific' do
    tag = Tag.first(name: params[:name])
    p tag
    @links = tag ? tag.links : []
    erb :'links/index'
  end
end
