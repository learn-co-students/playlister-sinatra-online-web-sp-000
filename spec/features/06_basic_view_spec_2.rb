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
    describe "/songs/:slug" do
      before do
        visit "/songs/#{@song.slug}"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end

      it "displays the song's artist" do
        expect(page).to have_content(artist_name)
      end

      it "displays the song's genres" do
        expect(page).to have_content(genre_name)
      end

      it "contains links to the artist's show page" do
        expect(page).to have_css("a[href='/artists/#{@artist.slug}']")
      end

      it "contains links to each genre's show page" do
        expect(page).to have_css("a[href='/genres/#{@genre.slug}']")
      end
    end
  end
end