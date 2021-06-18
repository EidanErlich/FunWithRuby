class Passenger
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def name
        @name
    end

    def has_flight?(str)
        return true if @flight_numbers.include?(str.upcase)
        return false
    end

    def add_flight(str)
        if !has_flight?(str)
            @flight_numbers << str.upcase
        end
    end

end #end of passenger class