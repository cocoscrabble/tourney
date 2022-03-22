class Tournament < ApplicationRecord
  has_many :entrants
  has_many :results
end
