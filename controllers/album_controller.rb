require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/album')

# index view displays all from albums
get "/albums" do
  @albums = Album.all()
  erb(:"albums/index")
end

#create
get "/albums" do
  @album = Album.new(params)
  @album.save()
  redirect to ("/inventory")
end

#delete
post "/albums/:id/delete" do
  @album = Album.find(params['id'])
  @album.delete()
  redirect to ("/inventory")
end

#edit
get "/albums/:id/edit" do
  @album = Album.find(params['id'])
  erb(:"albums/edit")
end

#update
post "/albums/:id" do
album = Album.new(params)
album.update()
redirect to ("/inventory")
end

#new
get "/albums/new" do
  erb(:"albums/new")
end


#show
get "/albums/:id" do
  @album = Album.find(params['id'].to_i)
  erb(:"albums/show")
end
