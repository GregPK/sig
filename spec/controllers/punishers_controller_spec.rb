require 'spec_helper'

describe PunishersController do
  describe "GET index[.json]" do
    it "Renders a list of json punishers" do
      get :index, format: :json
      
      body = JSON.parse(response.body)
      expect(body['punishers']).to be
      expect(body['punishers']).to be_a Array
      expect(body['punishers'].size).to be > 0
      
      punishers = [
        build(:unhealthy_food),
        build(:ten_point_punisher),
      ]
      
      punishers.each do |ach|
        has = body['punishers'].any?{ |m| m['name'] == ach.name }
        expect(has).to be true
      end
    end
  end
end
