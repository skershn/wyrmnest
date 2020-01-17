require 'rails_helper'

RSpec.describe DragonsController, type: :controller do

  describe "dragons#create" do
    it "should create a new instance of object Dragon" do
      new_dragon = FactoryBot.create(:dragon)
      expect(new_dragon.count).to eq(1)
    end
  end

end
