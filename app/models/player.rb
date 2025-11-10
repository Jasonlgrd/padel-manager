class Player < ApplicationRecord
  belongs_to :team
  has_one_attached :avatar

  validates :first_name, :last_name, presence: true
end
