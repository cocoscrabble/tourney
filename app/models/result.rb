class Result < ApplicationRecord
  belongs_to :tournament
  belongs_to :entrant
  belongs_to :opponent, class_name: "Entrant"
end
