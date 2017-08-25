class Airplane < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {minimum: 6}
  validates :name, presence: true
end
