require 'rails_helper'

RSpec.feature "User adds a new song" do

  scenario "they see the page for the individual song" do
    artist = create(:artist)
    song_title = "Wild Horses"

    visit "/artists/#{artist.id}"
    click_on "New song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link "<<Back To Artist Page", href: artist_path(artist)
  end
end
