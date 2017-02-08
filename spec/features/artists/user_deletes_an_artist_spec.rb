# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Delete"
# Then I should be back on the artist index page
# Then I should not see the artist's name

require 'rails_helper'

RSpec.feature "User deletes an artist" do
  let!(:artist1) { Artist.create(name:"Jethro Tull", image_path: "path") }
  let!(:artist2) { Artist.create(name: "Rolling Stones", image_path: "path") }
  let!(:artist3) { Artist.create(name: "The Beatles", image_path: "path") }

  scenario "artist no longer appears on artist index page" do
    visit '/artists'
    click_on "Jethro Tull"

    expect(current_path).to eq("/artists/#{artist1.id}")

    click_on "Delete"

    expect(current_path).to eq("/artists")
    expect(page).to_not have_content(artist1.name)
  end
end
