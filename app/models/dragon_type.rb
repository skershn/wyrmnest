class DragonType < ApplicationRecord
  enum rarity: [:common_dragon, :rare_dragon]
end