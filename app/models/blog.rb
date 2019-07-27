class Blog < ApplicationRecord
  extend FriendlyId

  enum status: { draft: 0, published: 1 }

  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic

  has_many :comments, dependent: :destroy

  scope :recent, -> { order('created_at DESC') }
end
