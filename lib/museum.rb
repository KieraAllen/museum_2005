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
      exhibit.cost

      interested_patrons = patrons.find_all { |patron| patron.interests.include?(exhibit.name) }
      list_them_patrons[exhibit] = interested_patrons
    end
    list_them_patrons
  end

  def ticket_lottery_contestants(exhibit)
    contestants = []
    require "pry"; binding.pry
    exhibits.each do |exhibit|
      patron.spending_money < exhibit.cost

    # exhibits[0].cost --> 0
    # exhibits[1].cost --> 10
    # exhibits[2].cost --> 15
    patrons_by_exhibit_interest.each do |exhibit|
    contestants << patrons.find_all { |patron| patron.spending_money < exhibit.cost }
    end
  end
    # returns an array of patrons
    # that do not have enough money to see an exhibit, but
    # are interested in that exhibit. The lottery winner is
    # generated randomly based on the available contestants
    # when `draw_lottery_winner` is called.
    contestants
  end
end
