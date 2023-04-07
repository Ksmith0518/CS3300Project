json.extract! game, :id, :Title, :Description, :Rating, :ReleaseDate, :NumberOfPlayers, :created_at, :updated_at
json.url game_url(game, format: :json)
