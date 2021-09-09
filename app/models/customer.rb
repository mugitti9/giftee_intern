class Customer < ApplicationRecord
  has_many  :tickets
  has_one   :profile
end
