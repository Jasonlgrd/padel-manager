# spec/models/match_spec.rb
require 'rails_helper'

RSpec.describe Match, type: :model do
  let(:team1) { Team.create!(name: "Team 1") }
  let(:team2) { Team.create!(name: "Team 2") }

  describe "validations" do
    it "is valid with a score and two different teams" do
      match = Match.new(team_a: team1, team_b: team2, score: "1-0")
      expect(match).to be_valid
    end

    it "is invalid without a score" do
      match = Match.new(team_a: team1, team_b: team2)
      expect(match).not_to be_valid
      expect(match.errors[:score]).to include("can't be blank")
    end

    it "is invalid if the teams are the same" do
      match = Match.new(team_a: team1, team_b: team1, score: "1-0")
      expect(match).not_to be_valid
      expect(match.errors[:base]).to include("Les deux équipes doivent être différentes")
    end
  end

  describe "#update_score!" do
    it "updates the score and broadcasts it" do
      match = Match.create!(team_a: team1, team_b: team2, score: "0-0")

      expect(ActionCable.server).to receive(:broadcast).with(
        "score_#{match.id}",
        { score: "2-1" }
      )

      match.update_score!("2-1")
      expect(match.reload.score).to eq("2-1")
    end
  end
end
