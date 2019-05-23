require 'spec_helper'

describe "Playlister Basics" do
  let(:artist_name) { "Person with a Face" }
  let(:genre_name) { "New Age Garbage" }
  let(:song_name) { "That One with the Guitar" }

  before do
    @song = Song.create(name: song_name)
    @genre = Genre.create(name: genre_name)
    @artist = Artist.create(name: artist_name)

    @song.song_genres.create(genre: @genre)
    @song.artist = @artist
  
    @song.save
  end


  describe "show pages" do
    describe "/genres/:slug" do
      before do
        visit "/genres/#{@genre.slug}"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end

      it "displays the genre's artists" do
        expect(page).to have_content(artist_name)
      end

      it "displays the genre's songs" do
        expect(page).to have_content(song_name)
      end

      it "contains links to each artist's show page" do
        expect(page).to have_css("a[href='/artists/#{@artist.slug}']")
      end

      it "contains links to each song's show page" do
        expect(page).to have_css("a[href='/songs/#{@song.slug}']")
      end
    end
  end
end