json.extract! entrant, :id, :tournament_id, :userid, :name, :player_number, :rating, :division, :created_at, :updated_at
json.url entrant_url(entrant, format: :json)
