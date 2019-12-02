class User < ApplicationRecord
  validates :name , presence: true
  validates :age, presence: true, length:  {maximum: 3}
  validates :email, presence: true, uniqueness: true


  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
end