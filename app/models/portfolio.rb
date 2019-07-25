class Portfolio < ApplicationRecord
  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies, allow_destroy: true, reject_if: ->(attrs) { attrs['name'].blank? }

  scope :ruby_on_rails_portfolio_items, lambda {
    where(subtitle: 'Ruby on rails')
  }

  scope :by_position, -> { order('position ASC') }

  def self.angular
    where(subtitle: 'Angular')
  end
end
