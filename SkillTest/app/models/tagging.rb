class Tagging < ApplicationRecord
  belongs_to :product,
  foreign_key: "taggable_id"
end
