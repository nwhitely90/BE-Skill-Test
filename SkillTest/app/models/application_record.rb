class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  #Scope
  scope :order_id_desc, -> { order(id: :desc) }
  scope :active, -> { where active: 1 }
end
