class Channel < ApplicationRecord
  belongs_to :buyer
  belongs_to :paper
  has_many :messages
end
