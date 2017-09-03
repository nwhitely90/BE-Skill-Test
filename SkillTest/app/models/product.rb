class Product < ApplicationRecord
  belongs_to :site
  
  #バリデーション
  validates :amazon_id, :price, :image, :title, :description, presence: true
  #validates :tag_list, uniqueness: true, presence: true ,format: { with: /\A[a-zA-Z0-9,]+\Z,/, message: "空白／記号なしの文字列を入力してください。" }
  
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
