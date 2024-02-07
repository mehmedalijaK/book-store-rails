class Book < ApplicationRecord
  belongs_to :category
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :category_id, presence: true, inclusion: { in: ->(_book) { Category.pluck(:id) } }
end
