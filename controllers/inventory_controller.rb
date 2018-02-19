require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/artist')
require_relative('../models/album')

#index
get "/Inventory" do
 @artists = Artist.all()
 @albums = Album.all()
erb(:"/inventory/index")
end

#create
post "/Inventory" do
  @artist = Artist.new(params)
  @album = Album.new(params)
  @album.save()
  redirect to ("/inventory")
end

#new
get "/inventory/new" do
  erb(:"inventory/new")
end

#show
get "/inventory/:id" do
@artist = Artist.find(params['id'].to_i)
@album = Album.find(params['id'].to_i)
erb(:"/inventory/show")
end

#edit
get "/inventory/:id/edit" do
  @artist = Artist.find(params['id'].to_i)
  @album = Album.find(params['id'].to_i)
  erb(:"/inventory/edit")
end

#update
post "/inventory/:id" do
  @artist = Artist.find(params)
  @album = Album.find(params)
  @album.update()
  @artist.update()
  redirect to("/inventory")

end

#delete
