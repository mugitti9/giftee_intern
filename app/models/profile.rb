class Profile < ApplicationRecord
    belongs_to   :customer

    enum sex: { 男: 0, 女: 1 }
end
