require_relative('../models/album.rb')
require('pry-byebug')

Album.delete_all

album1 = Album.new({
  'title' => 'A Hard Road',
  'quantity' => 5
  })

  album2 = Album.new({
    'title' => 'The Stooges',
    'quantity' => '3'
    })

    album1.save()
    album2.save()

    binding.pry()

    nil
