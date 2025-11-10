class ScoreChannel < ApplicationCable::Channel
  def subscribed
    stream_from "score_#{params[:match_id]}"
  end
end
