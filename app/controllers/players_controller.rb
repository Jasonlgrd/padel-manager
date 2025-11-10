class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
    @teams = Team.all
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      UserMailer.with(player: @player).new_user_email.deliver_now
      redirect_to @player, notice: "Joueur créé avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @player.update(player_params)
      UserMailer.with(player: @player).new_user_email.deliver_now
      redirect_to @player, notice: "Joueur mis à jour avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @player = Player.find_by(id: params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name, :ranking, :team_id, :avatar)
  end
end
