class Match < ApplicationRecord
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"

  validates :score, presence: true
  validate :teams_must_be_different

  private

  def teams_must_be_different
    errors.add(:base, "Les deux équipes doivent être différentes") if team_a == team_b
  end
end
