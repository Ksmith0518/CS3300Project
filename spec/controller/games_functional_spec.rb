require "rails_helper"
require 'rspec/rails'

RSpec.describe GamesController, :type => :controller do
    login_user
    
    context "GET #create" do
        # This should return the minimal set of attributes required to create a valid
        # PROJECT. As you add validations to project, be sure to adjust the attributes here as well.
        let(:valid_attributes) {{ :Title => "Test title!", :Description => "This is a test description", :Rating => "41", :ReleaseDate => "05/18/2001", :NumberOfPlayers => "10" }}


        let(:valid_session) { {} }


        describe "GET #create" do
            it "returns a success response" do
                Game.create! valid_attributes
                get :index, params: {}, session: valid_session
                expect(response).to have_http_status(:ok)
            end
        end
    end


    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:game) { Game.create(Title: "Test title", Description: "Test description",Rating: "9", ReleaseDate: "05/18/2001", NumberOfPlayers: "10000" ) }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        context "POST #create a new game" do
            it "Makes a new game, and posts it up to the data base" do
                Game.create(Title: "Test title", Description: "Test description",Rating: "9", ReleaseDate: "05/18/2001", NumberOfPlayers: "10000" ) 
                expect(response).to have_http_status(:ok)
            end
        end
        context "DELETE #destroy a existing game" do
            let!(:game) { Game.create(Title: "Test title", Description: "Test description",Rating: "9", ReleaseDate: "05/18/2001", NumberOfPlayers: "10000" ) }
            it "deletes a game that already exists" do
                game.destroy
                expect(response).to have_http_status(:ok)
            end
        end
        context "PATCH #update a existing game with new information" do
            let!(:game) {Game.create(Title: "Test title", Description: "Test description",Rating: "9", ReleaseDate: "05/18/2001", NumberOfPlayers: "10000" )}
            it "updates a game that already exists" do
                game.update(Title: "new Title")
            end
        end
    end
end

