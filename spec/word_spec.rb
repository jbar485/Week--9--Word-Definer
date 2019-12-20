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

  describe(".find") do
    it("will find a word by its id") do
      word = Word.new("Nothing", nil)
      word.save()
      word2 = Word.new("Everything", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe("#update") do
    it("will update a word based on its id") do
      word = Word.new("Dope", nil)
      word.save()
      word.update("Sweet")
      expect(word.name).to(eq("Sweet"))
    end
  end

  describe("#update") do
    it("will test to see if it will update if the user enters nothing") do
      word = Word.new("Junk", nil)
      word.save()
      word.update("")
      expect(word.name).to(eq("Junk"))
    end
  end
end
