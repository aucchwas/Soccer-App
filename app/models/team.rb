class Team < ApplicationRecord
  belongs_to :league
  validates :team_name, presence: true
end
