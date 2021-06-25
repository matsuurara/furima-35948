class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :info
    validates :price
    validates :user
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :delivery_charger_id
    validates :delivery_date_id
    validates :category_id
    validates :region_id
  end


  belongs_to :user
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_date
  belongs_to :delivery_charger
  belongs_to :region
  has_one_attached :image
end
