
class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

    def pivot(domain, name)
      @name = name
      @domain = domain

       #given a string of a **domain** and a string of a **name**, change the domain and name of the
       #startup
    end

    def self.all
      @@all
    end

    def self.find_by_founder(founder) #works!
      @@all.find do |startup|
        startup.founder == founder
      end
      #- given a string of a **founder's name**, returns the **first startup** whose founder's
      #name matches
    end

    def self.domains #works!!
      @@all.collect do |startup|
        startup.domain
      end.uniq
      #- should return an **array** of all of the different startup domains
    end

    def sign_contract(venture_capitalist, type, investment) #works!
      FundingRound.new(self, venture_capitalist, type, investment)
   #   - given a **venture capitalist object**, type of investment (as a string), and the amount
   #   invested (as a float), creates a new funding round and associates it with that startup and venture
   #   capitalist.
    end

    def this_startup #works!
      FundingRound.all.select do |round|
        round.startup == self
      end
    end

    def num_funding_rounds #works!
      this_startup.count
   #   - Returns the total number of funding rounds that the startup has gotten
    end

    def total_funds #works!
      this_startup.collect do |startup|
        startup.investment.to_f
      end.sum
   #   - Returns the total sum of investments that the startup has gotten
    end

    def investors #works!
      this_startup.collect do |startup|
        startup.venture_capitalist
      end.uniq
   #   - Returns a **unique** array of all the venture capitalists that have invested in this company
    end

    def big_investors #works!
      this_startup.select do |startup|
        startup.venture_capitalist.total_worth >= 1000000000
      end
   #   - Returns a **unique** array of all the venture capitalists that have invested in this
   #   company and are in the Trés Commas club
    end

end
