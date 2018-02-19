require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/artist')
require_relative('../models/album')

#index
get "/inventory" do
 @artists = Artist.all()
 @albums = Album.all()
erb(:"/inventory/index")
end

#create
post "/inventory" do
  @album = Album.new(params)
  @album.save()
  redirect to ("/inventory")
end

#new_album
get "/inventory/new" do
  erb(:"inventory/new/album")
end

#show_album
get "/inventory/:id" do
@album = Album.find(params['id'].to_i)
erb(:"/inventory/show")
end

#edit
get "/inventory/:id/edit" do
  @album = Album.find(params['id'].to_i)
  erb(:"/inventory/edit")
end

#update
post "/inventory/:id" do
  album = Album.new(params)
  album.update()
  redirect to(:"/inventory")

end

#delete
