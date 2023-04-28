require "rails_helper"

describe "Project Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating game" do
      game = Game.new(Description: "Content of the description")
      expect(game.valid?).to eq(false)
    end
    it "esnures the description is present when creating the game" do
        game = Game.new(Title: "Title")
        expect(game.valid?).to eq(false)
    end
    it "should not be able to save project when title missing" do
      game = Game.new(Description: "Some description content goes here")
      expect(game.save).to eq(false)
    end
    it "should be able to save project when have description and title" do
      game = Game.new(Title: "Title", Description: "Content of the description")
      expect(game.save).to eq(true)
    end
  end
end

describe "Project Attribute Requirements on Edit", :type => :model do
  context "Edit project" do  
    before (:each) do
      @game = Game.create(Title: "Title", Description: "Content of the description")
 
      end
    it "ensures the title is present when editing project" do
      @game.update(:Title => "New Title")
      expect(@game.Title == "New Title")
    end
  end
end
