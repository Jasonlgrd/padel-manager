class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  has_many :home_matches, class_name: "Match", foreign_key: "team_a_id"
  has_many :away_matches, class_name: "Match", foreign_key: "team_b_id"

  validates :name, presence: true
end
