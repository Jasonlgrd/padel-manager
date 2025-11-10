class Player
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :ranking, :integer
end
