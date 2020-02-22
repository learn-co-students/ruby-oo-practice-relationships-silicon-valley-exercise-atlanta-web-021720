require 'pry'
class FundingRound
    attr_reader :name

    @@all = []
    def initialize(name)
        @name = name
        @@all<< self
    end

    def self.all
        @@all
    end

    def venture_capitalist
    
    end 
    
    def type
    
    end 

    def investment
    
    end 
    
end


# binding.pry
