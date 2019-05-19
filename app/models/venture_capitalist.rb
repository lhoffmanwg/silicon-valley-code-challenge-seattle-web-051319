
class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club #works!
    @@all.select do |vc|
      vc.total_worth >= 1000000000
    end
    #returns an array of all venture capitalists in the Trés Commas club (they have more then
    #  1,000,000,000 `total_worth`)
  end

  def offer_contract(startup, type, investment) #works!
    FundingRound.new(startup, self, type, investment)
    #- given a **startup object**, type of investment (as a string), and the amount invested (as a float),
    # creates a new funding round and associates it with that startup and venture capitalist.
  end

  def funding_rounds #works!
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
    #- returns an array of all funding rounds for that venture capitalist
  end

  def portfolio #works!
    funding_rounds.collect do |round|
      round.startup
    end.uniq
    #- Returns a **unique** list of all startups this venture capitalist has funded
  end

  def biggest_investment #works!
    funding_rounds.collect do |round|
      round.investment
    end.max

    # OR

    # max_round = 0
    # funding_rounds.collect do |round|
    #   if round.investment > max_round
    #     max_round = round.investment
    #   end
    # end
    # max_round
    #- returns the largest funding round given by this venture capitalist
  end

  def invested(domain) #works!
    funding_rounds.collect do |round|
      round.investment
    end.sum
    #- given a **domain string**, returns the total amount invested in that domain
  end
end
