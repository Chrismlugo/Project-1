require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/artist')

#index
get "/artists" do
  @artists = Artist.all()
  erb(:"artists/index")
end

#create
post "/artists" do
  @album = Artist.new(params)
  @album.save()
  redirect to ("/inventory")
  erb(:"artists/create")
end

#delete
post "/artists/:id/delete" do
  @artist = Artist.find(params['id'])
  @artist.delete()
  redirect to ("/artists")
  erb(:"artists/delete")
end

#edit
get "/artists/:id/edit" do
  @artist = Artist.find(params['id'])
  erb(:"artists/edit")
end

#update
post "/artists/:id" do
artist = Artist.new(params)
artist.update()
erb(:"artists/update")
end

#new
get "/artists/new" do
  erb(:"artists/new")
end


#show
get "/artists/:id" do
  @artist = Artist.find(params['id'].to_i)
  erb(:"artists/show")
end
