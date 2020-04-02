class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :sender, polymorphic: true
end
