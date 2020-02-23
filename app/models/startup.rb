class Startup
    attr_accessor :name
    attr_reader :domain

    @@all = []

    def initialize(domain,name)
        @domain = domain
        @name = name
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end   

    def domain
        @domain
    end
    
    def self.all
        @@all
    end 
    
    def self.find_by_founder(name)
        @@all.find do | startup |
            startup.name == name   
        end
    end    

    # def find_by_founder(name)
    #     @@all.find do | startup |
    #         startup.name == name   
    #     end
    # end
    
    # def self.domains
    #     ret_domains = []
    #     @@all.each do | startup |
    #         ret_domains << startup.domain   
    #     end
    #     ret_domains 
    # end

    def self.domains    
        @@all.map do |starup|
            starup.domain
        end
    end
    
    # @arg capitalist : venture_capitalist, @arg type : type_of_investment, @arg investment : amount_of_invested
    def sign_contract(capitalist, type, investment)       
        FundingRound.new(self,capitalist, type, investment)
    end

    def funding_rounds
        # FundingRound.all.select do |round|
        #     round.startup == self
        # end
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def num_funding_rounds
        # rounds = FundingRound.all.select do |round|
        #     round.startup == self
        # end
        # rounds.length

        # (FundingRound.all.select do |round|
        #     round.startup == self
        # end).length

        funding_rounds.length
    end

    def funds
        funding_rounds.map do |round|
            round.investment 
        end  
    end

    def total_funds
        # (funding_rounds.map do |round|
        #     round.venture_capitalist.total_worth
        # end).inject(0,:+).to_f
        funds.inject(0,:+).to_f    
    end

    def investors
        (funding_rounds.map do |round| 
            round.venture_capitalist 
        end).uniq
    end

    def big_investors
        # (investors.map do |inventor|
        #     if VentureCapitalist.tres_commas_club.include? inventor 
        #         inventor
        #     end    
        # end).uniq   
        
        #changed using map to select method to remove nil from return value
        # investors.select do |inventor|
        #     if VentureCapitalist.tres_commas_club.include? inventor 
        #         inventor
        #     end  
        # end
        investors.select do |inventor| 
            VentureCapitalist.tres_commas_club.include? inventor ? inventor : nil 
        end
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


