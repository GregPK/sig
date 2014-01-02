require 'spec_helper'

describe AchievementsController do
 describe "GET index" do
    it "Renders a list of json achievements" do
      get :index, format: :json
      
      body = JSON.parse(response.body)
      expect(body['achievements']).to be
      expect(body['achievements']).to be_a Array
      expect(body['achievements'].size).to be > 0
      
      achievements = [
        build(:achievement),
        build(:asana_task_achievement),
        build(:exercise)
      ]
      
      achievements.each do |ach|
        has = body['achievements'].any?{ |m| m['name'] == ach.name }
        expect(has).to be true
      end
    end
  end
end
