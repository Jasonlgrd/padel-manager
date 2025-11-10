class UserMailer < ApplicationMailer
  default from: "new-user@padel-manager.com"

  def new_user_email
    @player = params[:player]
    mail(to: "president@padel-manager.com", subject: "Un nouveau joueur a été créé !")
  end
end
