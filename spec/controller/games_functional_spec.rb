require "rails_helper"

RSpec.describe GamesController, :type => :controller do
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:project) { Game.create(Title: "Test title", Description: "Test description",Rating: "9", ReleaseDate: "05/18/2001", NumberOfPlayers: "10000" ) }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        context "GET #edit a nonexistent game" do
            it "raises an error" do
                expect(get :edit, params: {"id": 9999999}).to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
end

