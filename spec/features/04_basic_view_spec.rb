require 'spec_helper'

describe "Playlister Basics" do
  let(:song_name) { "That One with the Guitar" }

  before do
    @song = Song.create(name: song_name)
    @song.save
  end

  describe "index pages" do
    describe "/songs" do
      before do
        visit "/songs"
      end

      it 'responds with a 200 status code' do
        expect(page.status_code).to eq(200)
      end

      it "displays a list of songs" do
        expect(page).to have_content(song_name)
      end
    end
  end
end