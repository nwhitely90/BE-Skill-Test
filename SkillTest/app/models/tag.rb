class Tag < ApplicationRecord
  include FriendlyId
  friendly_id :name  
  has_many  :taggings
  
  #Scope
  scope :active_taggings, -> { where("taggings_count > ? ", 0) }
  
  
  def self.it content
    Tag.where(content).first_or_create! rescue nil
  end
end
