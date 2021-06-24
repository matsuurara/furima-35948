class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :info
    validates :price
    validates :status_id
    validates :delivery_charger_id
    validates :delivery_date_id
    validates :category_id
    validates :region_id
    validates :user
  end

  belongs_to :user
  has_one_attached :image
end
