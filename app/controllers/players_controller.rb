class PlayersController < ApplicationController
  def index
    @players = [
      Player.new({ name: "Nadal", ranking: 1 }),
      Player.new({ name: "Djokovic", ranking: 2 })
    ]

    UserMailer.with(player: @players.first).new_user_email.deliver_now
  end

  def new
  end

  def create
    @player = Player.new({ name: "Nadal", ranking: 1 })

    puts @player.name
    debugger

    UserMailer.with(player: @player).new_user_email.deliver_now

    format.html {
      redirect_to user_url(@user),
      notice: "User was successfully created."
    }
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
