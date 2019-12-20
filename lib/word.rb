class Word
  attr_reader :name, :id

  @@words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.all
    @@words.values().sort { |a, b| a.name.downcase <=> b.name.downcase}
  end

  def save
    @@words[self.id] = Word.new(self.name, self.id)
  end

  def ==(word_to_compare)
    self.name() == word_to_compare.name()
  end

  def self.find(id)
    @@words[id]
  end

  def self.search(word)
    @@words.values().select { |element| /#{word}/i.match? element.name}
  end

  def update(name)
    if name != ""
      @name = name
    end
  end

  def delete
    @@words.delete(self.id)
  end
end
