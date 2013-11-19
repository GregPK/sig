require 'test_helper'
require 'minitest/spec'
require 'minitest/mock'
require 'minitest/autorun' 
require 'pry'

require_relative '../lib/asana_to_sig'

class AsanaToSigSpec < MiniTest::Spec
  before do
    
  end

  describe "in general" do
    it "should have proper dependencies" do
      AsanaToSig.must_be_kind_of Module
    end
  end

 
  
end
