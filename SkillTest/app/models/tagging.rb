class Tagging < ApplicationRecord
  has_one :product, inverse_of: :taggings
end
