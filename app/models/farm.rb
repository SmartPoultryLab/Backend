class Farm < ApplicationRecord
  belongs_to :owner
  has_one :housing
  has_one :food
  has_one :bird
  has_one :breed
end
