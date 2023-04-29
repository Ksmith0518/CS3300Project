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
        expect(page).to have_content("Game was successfully updated")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "should fail" do
        within("form") do
            fill_in "Title", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Title can't be blank")
      end
    end
    context "Create game" do
        before(:each) do
            visit new_game_path
        end

        scenario "sucessfully create game" do
            within("form") do 
                fill_in "Title", with: "Game Title"
                fill_in "Description", with: "Game Description"
                fill_in "Rating", with: "10"
                fill_in "Releasedate", with: "05182001"
                fill_in "Numberofplayers", with: "10000"
            end

            click_button "Create Game"

            expect(page).to have_content("Game was successfully created")
        end

        scenario "game creation failed - no title" do
            within("form") do
                fill_in "Description", with: "Game Description"
                fill_in "Rating", with: "10"
                fill_in "Releasedate", with: "05182001"
                fill_in "Numberofplayers", with: "10000"
            end
            
            click_button "Create Game"

            expect(page).to have_content("Title can't be blank")
        end

        scenario "game creation failed - no description" do
            within("form") do
                fill_in "Title", with: "Game Title"
                #fill_in "Description", with: "Game Description"
                fill_in "Rating", with: "10"
                fill_in "Releasedate", with: "05182001"
                fill_in "Numberofplayers", with: "10000"
            end
            
            click_button "Create Game"
            
            expect(page).to have_content("Description can't be blank")
        end
        scenario "game creation failed - no description" do
            within("form") do
                fill_in "Title", with: "Game Title"
                fill_in "Description", with: "Game Description"
                #fill_in "Rating", with: "10"
                fill_in "Releasedate", with: "05182001"
                fill_in "Numberofplayers", with: "10000"
            end
            
            click_button "Create Game"
            
            expect(page).to have_content("Rating can't be blank")
        end

        scenario "game creation failed - no release date" do
            within("form") do
                fill_in "Title", with: "Game Title"
                fill_in "Description", with: "Game Description"
                fill_in "Rating", with: "halop"
                #fill_in "Releasedate", with: "05182001"
                fill_in "Numberofplayers", with: "10000"
            end
            
            click_button "Create Game"
            
            expect(page).to have_content("Releasedate can't be blank")
        end
        scenario "game creation failed - no number of players" do
            within("form") do
                fill_in "Title", with: "Game Title"
                fill_in "Description", with: "Game Description"
                fill_in "Rating", with: "halop"
                fill_in "Releasedate", with: "05182001"
                #fill_in "Numberofplayers", with: "10000"
            end
            
            click_button "Create Game"
            
            expect(page).to have_content("Numberofplayers can't be blank")
        end
    end
end
