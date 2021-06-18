class Flight
    def initialize(flight_number, capacity)
        @flight_number  = flight_number
        @capacity = capacity
        @passengers = []
    end #end of class

    def passengers
        @passengers
    end

    def full?
        return true if @passengers.length == @capacity
        return false
    end

    def board_passenger(pass)
        if !self.full? 
            if pass.has_flight?(@flight_number)
                @passengers << pass
            end
        end
    end

    def list_passengers
        arr = @passengers.map do |ele|
            ele.name
        end
        arr
    end

    def [](index)
        @passengers[index]
    end 

    def <<(pass)
        self.board_passenger(pass)
    end

end #end of class