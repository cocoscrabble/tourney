json.extract! result, :id, :tournament_id, :division, :round, :entrant_id, :opponent_id, :score, :opponent_score, :first, :created_at, :updated_at
json.url result_url(result, format: :json)
