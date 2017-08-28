class Product < ApplicationRecord
  belongs_to :site
  
  mount_uploader :image, ImageUploader
  
  acts_as_taggable_on :tags
  
end
