class Game < ApplicationRecord
    validates :Title, :Description, :Rating, :ReleaseDate, :NumberOfPlayers, presence: true
end
