class Customer < ApplicationRecord
  has_many  :ticket
  has_one   :profile
end
