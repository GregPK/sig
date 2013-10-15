require 'test_helper'
require 'minitest/spec'
require 'minitest/mock'
require 'minitest/autorun'

class AsanaToSigTest < MiniTest::Spec
  GK_KEY = '**ASANA_API_KEY**'

  before do
    secs_in_min = 60

    now = Time.now

    @tasks = [
      { name: "Not completed 1", completed_at: null },
      { name: "Not completed 2", completed_at: null },
      { name: "Completed just now 1", completed_at: now.to_s },
      { name: "Completed just now 2", completed_at: (now - Random.rand(10)).to_s },
      { name: "Completed just now 3", completed_at: (now - Random.rand(30)).to_s },
      { name: "Completed 3 minutes ago ", completed_at: (now - 3*secs_in_min - Random.rand(10)).to_s },
      { name: "Completed 6 minutes ago ", completed_at: (now - 6*secs_in_min - Random.rand(10)).to_s },
    ]

    @a2s = AsanaToSig.new('ASA_API_KEY')
  end

  it "should have proper dependencies" do
    AsanaToSig.must_be_kind_of Module
  end

  describe '#all_for_workspace' do
    workspace = MiniTest::Mock.new
    workspace.expect(:all, @tasks)

    workspace.all.size.must_equal(7)

  end
end
