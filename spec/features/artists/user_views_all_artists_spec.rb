require 'rails_helper'

RSpec.feature "User views all artists" do
  let!(:artist1) { Artist.create(name:"Jethro Tull", image_path: "path") }
  let!(:artist2) { Artist.create(name: "Rolling Stones", image_path: "path") }
  let!(:artist3) { Artist.create(name: "The Beatles", image_path: "path") }

  scenario "they visit the artists page to view all artists" do

    visit '/artists'

    within(".all-artists") do
      expect(page).to have_content(artist1.name)
      expect(page).to have_content(artist2.name)
      expect(page).to have_content(artist3.name)
    end
  end

  context "they click on the name of the artist" do
    scenario "they are taken to that artist's show page" do
      visit '/artists'

      click_on "Jethro Tull"

      expect(current_path).to eq("/artists/#{artist1.id}")
    end
  end
end
