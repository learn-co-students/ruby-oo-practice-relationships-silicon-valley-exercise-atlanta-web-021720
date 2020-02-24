require 'pry'

class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth.to_f
        @@all<< self
    end

    def name
        @name
    end

    def total_worth
        @total_worth
    end

    def self.all
        @@all
    end
    
    def self.tres_commas_club
        @@all.select do | capitalist|
            capitalist.total_worth >  1000000000.to_f
        end
    end

    def offer_contract(start_up, type, investment)       
        FundingRound.new(start_up, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.capitalist == self
        end
    end

    def portfolio
        (funding_rounds.map do |round| 
            round.startup 
        end).uniq
    end

    def investments
        funding_rounds.map do |round|
            round.investment 
        end  
    end

    def biggest_investment
        investments.max
    end

    def invested_domain(domain)
        funding_rounds.select do |round|
            round.startup.domain == domain    
        end
    end

    def invested (domain)
        # ((funding_rounds.select do |round|
        #     round.startup.domain == domain    
        # end).map do |domain_round|
        #     domain_round.investment
        # end).inject(0,:+).to_f

        arr_domain = invested_domain(domain)

        (arr_domain.map do |domain_round|
            domain_round.investment
        end).inject(0,:+).to_f
    end
end

