require 'pry'

class VentureCapitalist

    attr_accessor :total_worth
    attr_reader :name

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
        @@all.select do | venture_capitalist|
            venture_capitalist.total_worth >  1000000000.to_f
        end
    end

    def offer_contract
    
    end

    def funding_rounds
    
    end

    def portfolio
    
    end

    def biggest_investment
    
    end

    def invested
    
    end
end

# v = VentureCapitalist.new("Chan", 10000000)
# v2 = VentureCapitalist.new("Joon", 10000000000)
# v3 = VentureCapitalist.new("Jay", 2000000000)
# VentureCapitalist.all
# VentureCapitalist.tres_commas_club
# binding pry

