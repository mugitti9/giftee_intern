class Profile < ApplicationRecord
    belongs_to   :customer

    enum sex: { male: 0, female: 1 }
end
