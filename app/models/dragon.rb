class Dragon < ApplicationRecord
  belongs_to :user
  belongs_to :dragon_type
end
