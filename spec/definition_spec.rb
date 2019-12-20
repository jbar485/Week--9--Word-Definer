require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe "#Definition" do
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Sweet", nil)
    @word.save()
  end

  describe("#==") do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("Like sugar", @word.id, nil)
      definition2 = Definition.new("Like sugar", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe(".all") do
    it "will return a list of all the definitions" do
      definition = Definition.new("To be afraid", @word.id, nil)
      definition.save()
      definition2 = Definition.new("to be awesome", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe(".clear") do
    it("clears all definitions in the list") do
      definition = Definition.new("To be afraid", @word.id, nil)
      definition.save()
      definition2 = Definition.new("to be awesome", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a definition") do
      definition = Definition.new("To be afraid", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe(".find") do
    it "will find a definition by its id" do
      definition = Definition.new("To love someone", @word.id, nil)
      definition.save()
      definition2 = Definition.new("To hate someone", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe("#update") do
    it "will update a definition by its id" do
      definition = Definition.new("Awesome party", @word.id, nil)
      definition.save()
      definition.update("Cool Party", @word.id)
      expect(definition.name).to(eq("Cool Party"))
    end
  end
end
