class Dragon < ApplicationRecord
  belongs_to :user
  belongs_to :dragon_type

  def initialize(seed = nil)
    if seed
      @rng = Random.new(seed)
    else
      @rng = Random.new
    end
  end

  def roll_20
    @rng.rand(20)
  end

  @d = Dragon.new

  def initialize
    generate_dragon
  end

  private

  def generate_dragon
    case @d.roll_20
    when 0..9
      common
    when 10..14
      "opal"
    when 15..20
      "soot"
    end
  end

  def common
    case @d.roll_20
    when 0..6
      "red"
    when 7..13
      "blue"
    when 13..20
      "green"

