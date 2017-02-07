require 'rails_helper'

RSpec.feature "User edits an artist" do
  let!(:artist1) { Artist.create(name:"Jethro Tull", image_path: "https://musiccourt.files.wordpress.com/2011/12/bonobo-black-sands.jpg?w=980&h=696") }
  scenario "they enter data to edit the artist" do
    visit '/artists'
      click_on "Jethro Tull"

      expect(current_path).to eq("/artists/#{artist1.id}")

      click_on "Edit Artist"

      expect(current_path).to eq("/artists/#{artist1.id}/edit")

      fill_in "artist_name", with: "Bonobo"
      click_on "Update Artist"

      expect(page).to have_content "Bonobo"
      expect(page).to have_css("img[src=\"#{artist1.image_path}\"]")
  end
end
