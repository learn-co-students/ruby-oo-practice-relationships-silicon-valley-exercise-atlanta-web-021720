class Startup
    attr_accessor :name
    attr_reader :domain


    # def initialize()

    # end

    @@all = []

    def pivot(domain, name)
        @domain = domain
        @name = name
        @@all << self
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
    
    def self.domains
        ret_domains = []
        @@all.each do | startup |
            ret_domains << startup.domain   
        end
        ret_domains   
    end
end


# startup = Startup.new
# startup.pivot("domain_test","domain_name")
# startup.pivot("domain_test_3","domain_name_3")
# startup.pivot("domain_test_4","domain_name_4")

# startup_1 = Startup.new
# startup_1.pivot("domain_test_1","domain_name_1")
# puts Startup.domains



