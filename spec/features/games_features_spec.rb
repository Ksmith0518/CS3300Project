require "rails_helper"

RSpec.feature "Games", type: :feature do
    context "Update game" do
      let(:game) { Game.create(Title: "Test title", Description: "Test description",Rating: "9", ReleaseDate: "05/18/2001", NumberOfPlayers: "10000" ) }
      before(:each) do
        visit edit_game_path(game)
      end
 
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Game"
        expect(page).to have_content("Project was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Description can't be blank")
      end
    end
end
