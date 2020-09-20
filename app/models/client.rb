class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, length: {minimum: 3, maximum: 80}
  validates :last_name, length: {minimum: 1, maximum: 15}
  validates :last_name_kana, length: {minimum: 1, maximum: 20}
  validates :first_name, length: {minimum: 1, maximum: 15}
  validates :first_name_kana, length: {minimum: 2, maximum: 20}
  validates :postcode, length: {minimum: 3, maximum: 10}
  validates :address, length: {minimum: 3, maximum: 50}
  validates :telephone_number, length: {minimum: 3, maximum: 15}
  validates :password, presence: true, length: {minimum: 6}

end
