class Product < ApplicationRecord
  belongs_to :site
  
  #バリデーション
  validates :amazon_id, :price, :image, :title, :description, presence: true
  
  after_initialize :set_defaults, unless: :persisted?
  
  #画像アップロード用
  mount_uploader :image, ImageUploader
  
  #タグ用
  acts_as_taggable_on :tags
  
  #Pager用 - ページごとの数
  self.per_page = 20 

  def set_defaults
    self.active = true if self.active.nil?
  end
end
