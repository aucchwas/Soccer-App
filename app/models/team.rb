class Team < ApplicationRecord
  belongs_to :league
  validates :team_name, presence: true

  def self.search(query)
    where("team_name LIKE ?", "%#{query}%")
  end
end
