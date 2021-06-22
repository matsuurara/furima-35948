class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,
            format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
  validates :last_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, presence: true,
            format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ }
  validates :first_name_kana, presence: true,
            format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ }
  validates :birthday,presence: true
end
