class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(patron)
    patrons << patron
  end

  def patrons_by_exhibit_interest
    list_them_patrons = {}
    exhibits.each do |exhibit|
      interested_patrons = patrons.find_all { |patron| patron.interests.include?(exhibit.name) }
      list_them_patrons[exhibit] = interested_patrons
    end
    list_them_patrons
  end
end
