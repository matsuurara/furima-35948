class OrderAddress
  include ActiveModel::Model

  attr_accessor :postal_code, :region_id, :city, :house_number, :floor, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :region_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A[0-9]+\z/ }, length: { minimum: 10, maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number, floor: floor,
                   telephone_number: telephone_number, order_id: order.id)
  end
end
