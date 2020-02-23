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

# s = Startup.new("domain_test","domain_name")
# v = VentureCapitalist.new("Chan", 10000000)

# s1 = Startup.new("domain_test_1","domain_name_1")
# v1 = VentureCapitalist.new("Joon", 10000000000)

# s2 = Startup.new("domain_test_2","domain_name_2")
# v2 = VentureCapitalist.new("Jay", 20000000000)

# s3 = Startup.new("domain_test_3","domain_name_3")
# v3 = VentureCapitalist.new("Jay", 20000000000)

# f = FundingRound.new(s,v,"Angel")
# f1 = FundingRound.new(s1,v1,"Pre-Seed")
# f2 = FundingRound.new(s2,v2,"Seed")
# f3 = FundingRound.new(s3,v2,"Series A")

# f = FundingRound.new(Startup.new("domain_test","domain_name"),VentureCapitalist.new("Chan", 10000000) , "Angel")
# f2 = FundingRound.new(Startup.new("domain_test_2","domain_name_2"),VentureCapitalist.new("Joon", 10000000000) , "Pre-Seed")
# f.startup
# f.type # "Angel", "Pre-Seed", "Seed", "Series A", "Series B", "Series C"
# f.investment
# binding.pry
