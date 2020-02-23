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
    
    # @arg capitalist : venture_capitalist, @arg type : type_of_investment, @arg invested : amount_of_invested
    def sign_contract(capitalist, type, invested)       
        capitalist.total_worth = invested.to_f
        FundingRound.new(self,capitalist, type)
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
            round.venture_capitalist.total_worth 
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
        # investors
        # VentureCapitalist.tres_commas_club
    end
end


#startup = Startup.new("domain_test","domain_name")
#startup.pivot("domain_test","domain_name")
#startup.pivot("domain_test_3","domain_name_3")
#startup.pivot("domain_test_4","domain_name_4")

#startup_1 = Startup.new("domain_test_1","domain_name_1")

#startup.
#startup_1.pivot("domain_test_1","domain_name_1")
#puts Startup.domains



