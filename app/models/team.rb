class Team < ApplicationRecord
  belongs_to :league
  has_many :players
  validates :team_name, presence: true

  def self.search(query)
    where("team_name LIKE ?", "%#{query}%")
  end
end
