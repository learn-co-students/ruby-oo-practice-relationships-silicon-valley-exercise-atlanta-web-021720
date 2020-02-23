require 'pry'
class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type

    @@all = []
    def initialize(startup, venture_capitalist, type)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @@all<< self
    end

    def self.all
        @@all
    end

    def startup
        @startup
    end 

    def venture_capitalist
        @venture_capitalist
    end 
    
    def type
        @type
    end 
    
    def investment
        # a.inject{ |sum,x| sum + x }
        # a.inject(:+)

        (@@all.map do |funding_round| 
            funding_round.venture_capitalist.total_worth
        end).inject(0,:+).to_f             
    end 
end

# f = FundingRound.new(Startup.new("domain_test","domain_name"),VentureCapitalist.new("Chan", 10000000) , "Angel")
# f2 = FundingRound.new(Startup.new("domain_test_2","domain_name_2"),VentureCapitalist.new("Joon", 10000000000) , "Pre-Seed")
# f.startup
# f.type # "Angel", "Pre-Seed", "Seed", "Series A", "Series B", "Series C"
# f.investment
# binding.pry
