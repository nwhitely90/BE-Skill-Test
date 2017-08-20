class Site < ApplicationRecord
  belongs_to :user
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.active = true if self.active.nil?
  end
end
