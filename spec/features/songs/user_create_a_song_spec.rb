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

  context "the submitted data is invalid without a title" do
    scenario "they see an error message" do
      artist = create(:artist)

      visit artist_path(artist)
      click_on "New song"
      click_on "Create Song"

      expect(page).to have_content "Title can't be blank"
    end
  end
end

# As a user
# Given that an artist exists in the database
# When I visit the individual artist page
# And I click "New song"
# And I click "Create Song"
# Then I should see "Title cannot be blank" on the page
