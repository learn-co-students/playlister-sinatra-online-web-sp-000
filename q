
[1mFrom:[0m /mnt/c/Users/willc/dev/flatiron/labs/playlister-sinatra-online-web-sp-000/app/controllers/songs_controller.rb @ line 26 self.POST /songs:

    [1;34m21[0m:         @song = [1;34;4mSong[0m.new(params[[33m:song[0m])
    [1;34m22[0m:         [1;34m# @song.name = Song.titleize(params[:name])[0m
    [1;34m23[0m: 
    [1;34m24[0m:         @song.artist = [1;34;4mArtist[0m.find_or_create_by([35mname[0m: params[[33m:artist_name[0m])
    [1;34m25[0m:         
 => [1;34m26[0m:         binding.pry
    [1;34m27[0m:         [1;34m# params[:genre_ids].each {|genre_id|[0m
    [1;34m28[0m:         [1;34m#     @song.genres << Genre.find(genre_id)[0m
    [1;34m29[0m:         [1;34m# }[0m
    [1;34m30[0m:         @song.save
    [1;34m31[0m:         flash[[33m:message[0m] = [31m[1;31m"[0m[31mSuccessfully created song.[1;31m"[0m[31m[0m

