class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to @match, notice: "Match créé avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @match.update(match_params)
      redirect_to @match, notice: "Match mis à jour avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @match = Match.find_by(id: params[:id])
  end

  private

  def match_params
    params.require(:match).permit(:score, :team_a_id, :team_b_id)
  end
end
