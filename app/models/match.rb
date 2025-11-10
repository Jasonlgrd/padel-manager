class Match < ApplicationRecord
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"

  validates :score, presence: true
  validate :teams_must_be_different

  def update_score!(score)
    update(score:)
    ActionCable.server.broadcast("score_#{id}", { score: score })
  end
  
  private

  def teams_must_be_different
    errors.add(:base, "Les deux équipes doivent être différentes") if team_a == team_b
  end
end
