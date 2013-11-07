require 'test_helper'
require 'json'


class AchievementControllerTest < ActionDispatch::IntegrationTest
  before do
   # @item = Factory.create(:item)
  end

  describe "the achievement api" do
    it "responds with a list with all achievements" do
      get "/achievements.json"
      response.success?.must_equal true
      elems = JSON.parse(body)
      
      elems.size.must_equal 2
      #items = JSON.parse(response.body)
      #items.any?{|x| x[""] == @item.name}.must_equal true
    end
    
   
  end

end
