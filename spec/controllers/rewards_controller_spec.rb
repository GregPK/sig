require 'spec_helper'

describe RewardsController do
  describe "GET index[.json]" do
    it "Renders a list of json rewards" do
      get :index, format: :json
      
      body = JSON.parse(response.body)
      expect(body['rewards']).to be
      expect(body['rewards']).to be_a Array
      expect(body['rewards'].size).to be > 0
      
      rewards = [
        build(:ten_point_reward),
        build(:qi),
        build(:comedy_animated_show),
      ]
      
      rewards.each do |ach|
        has = body['rewards'].any?{ |m| m['name'] == ach.name }
        expect(has).to be true
      end
    end
  end
end