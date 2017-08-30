class Site < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  
  #サイト名で検索出来るよう
  include FriendlyId
  friendly_id :site_url
  
  
  
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.active = true if self.active.nil?
  end
  

end
