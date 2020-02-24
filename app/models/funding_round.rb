require 'pry'
class FundingRound

    attr_reader :startup, :capitalist, :type, :investment  

    @@all = []
    def initialize(startup, capitalist, type, investment)
        @startup = startup
        @capitalist = capitalist
        @type = type
        @investment = investment.to_f
        @@all<< self
    end

    def self.all
        @@all
    end

    def startup
        @startup
    end 

    def capitalist
        @capitalist
    end 
    
    def type
        @type
    end 
    
    def investment
        # a.inject{ |sum,x| sum + x }
        # a.inject(:+)

        # (@@all.map do |funding_round| 
        #     funding_round.capitalist.total_worth
        # end).inject(0,:+).to_f         

        @investment.to_f
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

# f = FundingRound.new(s,v,"Angel", 1000)
# f1 = FundingRound.new(s,v1,"Pre-Seed", 20000)
# f2 = FundingRound.new(s2,v2,"Seed",30000)
# f3 = FundingRound.new(s3,v2,"Series A",50000)
# f5 = FundingRound.new(s,v2,"Series B",70000)
# f7 = FundingRound.new(s,v2,"Series B",9000)

# v.offer_contract(s3, "Series C", 100000)

#binding.pry

