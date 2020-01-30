class RandomizersController < ApplicationController
  
  def initialize(seed = nil)
    if seed
      @rng = Random.new(seed)
    else
      @rng = Random.new
    end
  end

  def roll
    @rng.rand(20)
  end

end
