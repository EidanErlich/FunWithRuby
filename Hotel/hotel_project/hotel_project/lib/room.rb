class Room

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end #end of initialize

    def capacity
        @capacity
    end #end of capacity

    def occupants
        @occupants
    end #end of occupants

    def full?
        return false if @occupants.length < @capacity
        return true if @occupants.length == @capacity
    end #end of full?

    def available_space
        return @capacity - @occupants.length
    end #end of available_space

    def add_occupant(name)
        if !self.full?
            @occupants << name
            return true
        else
            return false
        end
    end #end of add_occupant

    
end #end of Room class
