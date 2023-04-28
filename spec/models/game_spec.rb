require "rails_helper"

describe "Game Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating game" do
      game = Game.new(Description: "Content of the description")
      expect(game.valid?).to eq(false)
    end
    it "esnures the description is present when creating the game" do
        game = Game.new(Description: "description")
        expect(game.valid?).to eq(false)
    end
    it "esnures the rating is present when creating the game" do
      game = Game.new(Rating: "5")
      expect(game.valid?).to eq(false)
  end
  it "esnures the release date is present when creating the game" do
    game = Game.new(ReleaseDate: "05/18/2001")
    expect(game.valid?).to eq(false)
  end
  it "esnures the number of players is present when creating the game" do
    game = Game.new(NumberOfPlayers: "5")
    expect(game.valid?).to eq(false)
end
    it "should not be able to save the game when title missing" do
      game = Game.new(Description: "Some description content goes here",Rating: "10", ReleaseDate: "10/12/1999", NumberOfPlayers: "100")
      expect(game.save).to eq(false)
    end
    it "should not be able to save the game when description missing" do
      game = Game.new(Title: "Some Title content goes here",Rating: "10", ReleaseDate: "10/12/1999", NumberOfPlayers: "100")
      expect(game.save).to eq(false)
    end
    it "should not be able to save the game when rating missing" do
      game = Game.new(Title: "Some Title content goes here",Description: "Some description content goes here", ReleaseDate: "10/12/1999", NumberOfPlayers: "100")
      expect(game.save).to eq(false)
    end
    it "should not be able to save the game when release date missing" do
      game = Game.new(Title: "Some Title content goes here",Description: "Some description content goes here",Rating: "10", NumberOfPlayers: "100")
      expect(game.save).to eq(false)
    end
    it "should not be able to save the game when number of players missing" do
      game = Game.new(Title: "Some Title content goes here",Description: "Some description content goes here",Rating: "10", ReleaseDate: "10/12/1999")
      expect(game.save).to eq(false)
    end
    it "should be able to save project when have Title, Description, Rating, Release Date, Number of players" do
      game = Game.new(Title: "Title", Description: "Content of the description", Rating: "10", ReleaseDate: "1/01/2000", NumberOfPlayers: "10000")
      expect(game.save).to eq(true)
    end
  end
end

describe "Project Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @game = Game.create(Title: "Title", Description: "Content of the description")
 
      end
    it "ensures the title is present when editing game" do
      @game.update(:Title => "New Title")
      expect(@game.Title == "New Title")
    end
    it "ensures the description is present when editing game" do
      @game.update(:Description => "New Description")
      expect(@game.Description == "New Description")
    end
    it "ensures the Rating is present when editing game" do
      @game.update(:Rating => "10")
      expect(@game.Rating == "10")
    end
    it "ensures the Relase Date is present when editing game" do
      @game.update(:ReleaseDate => "05/18/2001")
      expect(@game.ReleaseDate == "05/18/2001")
    end
    it "ensures the Number Of Players is present when editing game" do
      @game.update(:NumberOfPlayers => "1000")
      expect(@game.NumberOfPlayers == "1000")
    end
  end
  
end
