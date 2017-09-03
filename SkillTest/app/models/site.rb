class Site < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  
  validates :name,:explanation, presence: true
  validates :site_url, uniqueness: true, presence: true ,format: { with: /\A[a-zA-Z0-9]+\Z/, message: "空白／記号なしの文字列を入力してください。" }
  
  #サイト名で検索出来るよう
  include FriendlyId
  friendly_id :site_url
  
  #画像アップロード用
  mount_uploader :image, ImageUploader
  
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.active = true if self.active.nil?
  end
  
end
