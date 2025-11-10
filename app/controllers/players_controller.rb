class PlayersController < ApplicationController
  def index
    @players = [
      Player.new({ first_name: "Rafael", last_name: "Nadal", ranking: 1 }),
      Player.new({ first_name: "Novak", last_name: "Djokovic", ranking: 2 })
    ]

    UserMailer.with(player: @players.first).new_user_email.deliver_now
  end

  def new
  end

  def create
    @player = Player.new({ last_name: "Nadal", ranking: 1 })

    puts @player.last_name
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
