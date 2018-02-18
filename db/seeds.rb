require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require('pry-byebug')

Artist.delete_all
Album.delete_all


artist1 = Artist.new({
  'name' => 'John Mayall and the Bluesbreakers'
  })
  artist1.save()

  artist2 = Artist.new({
    'name' => 'The Stooges'
    })
    artist2.save()

  artist3 = Artist.new({
    'name' => 'Black Sabbath'
    })
    artist3.save()

  artist4 = Artist.new({
    'name' => 'Jamiroquai'
    })
    artist4.save()

    album1 = Album.new({
      'title' => 'A Hard Road',
      'quantity' => 5,
      'artist_id' => artist1.id
      })
      album1.save()

      album2 = Album.new({
        'title' => 'The Stooges',
        'quantity' => '3',
        'artist_id' => artist2.id
        })
        album2.save()
      album3 = Album.new({
        'title' => 'Vol. 4',
        'quantity' => '3',
        'artist_id' => artist3.id
        })
        album3.save()
      album4 = Album.new({
        'title' => 'Black Sabbath',
        'quantity' => '3',
        'artist_id' => artist3.id
        })
        album4.save()





    binding.pry()

    nil
