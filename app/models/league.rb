class League < ApplicationRecord
  has_many :teams

  validates :league_name, presence: true
  validates :country_name, presence: true
end
