json.extract! player, :id, :userid, :name, :rating, :created_at, :updated_at
json.url player_url(player, format: :json)
