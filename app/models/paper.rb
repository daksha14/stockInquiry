class Paper < ApplicationRecord
  has_many :channels,dependent: :destroy
  paginates_per 5
end
