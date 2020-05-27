class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    exhibit_recs = []
    exhibits.each do |exhibit|
      patron.interests.each do |interest|
        if interest == exhibit.name
          exhibit_recs << exhibit
        end
      end
    end
    exhibit_recs
  end
end
