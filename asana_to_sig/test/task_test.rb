require 'test_helper'

require 'asana_to_sig'

class AsanaTaskSpec < MiniTest::Spec
  before do
   
  end

  describe '#completed' do
    it "should return false when not given a date" do
      task = AsanaToSig::Task.new({ name: "Not completed 1", completed_at: nil })
      task.completed?.must_equal false
      task.completed_between?(Time.now,Time.now+1).must_equal false
    end
  end
  
  describe '#manado' do
    manado = 1234
    it "should return the proper Manado count for notes" do
      notes = [
        "manado:#{manado}",
        "manado: #{manado}",
        "MaNaDo: #{manado}",
        "   manado: #{manado}   ",
        "Lorem ipsum   manado: #{manado}   ",
        "Lorem ipsum   manado: #{manado} et dolor  ",
        "Lorem ipsum\n   manado: #{manado}\n et \ndolor  ",
        "\n\nLorem ipsum\n   manado: #{manado}\n et \ndolor  ",
        "manado: #{manado}\n et \ndolor  ",
      ]
      
      notes.each do |note|
        AsanaToSig::Task.manado_parse(note).must_equal manado
      end
      
    end
  end
  
  
end
