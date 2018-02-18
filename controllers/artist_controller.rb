require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('../models/artist')

#index
get "/artists" do
  @artists = Artist.all()
  erb(:"artists/index")
end

#show
get "/artists/:id" do
  @artist = Artist.find(params['id'].to_i)
  erb(:"artists/show")
end
