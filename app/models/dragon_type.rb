class DragonType < ApplicationRecord
  belongs_to :dragon

  enum class: [:common_dragon, :rare_dragon]
end