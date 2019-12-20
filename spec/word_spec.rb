require 'rspec'
require 'pry'
require 'word'

describe "Word" do
  before(:each) do
    Word.clear()
  end

  describe(".all") do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a word that the user enters") do
      word = Word.new("Awesome", nil)
      word.save()
      word2 = Word.new("Cool", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end
end
