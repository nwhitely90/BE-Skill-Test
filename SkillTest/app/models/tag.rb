class Tag < ApplicationRecord
  include FriendlyId
  friendly_id :name  
  
  def self.it content
    Tag.where(content).first_or_create! rescue nil
  end
end
