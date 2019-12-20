require 'rspec'
require 'pry'
require 'word'

describe "Word" do
  before(:each) do
    Word.clear()
  end

  describe(".clear") do
    it("clears all the words to make the tests run") do
      word = Word.new("Super", nil)
      word.save()
      word2 = Word.new("Sweet", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
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

  describe("#==") do
    it("it is the same word if it is equal to another word") do
      word = Word.new("Awesome", nil)
      word2 = Word.new("Awesome", nil)
      expect(word).to(eq(word2))
    end
  end
end
