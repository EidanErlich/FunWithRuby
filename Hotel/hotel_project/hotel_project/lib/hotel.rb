require_relative "room"

class Hotel
    def initialize(name, capacities)
        @name = name
        @rooms = {}
        capacities.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end #end of do room_name, capacity
    end #end of initilize

    def name 
        @name.split(" ").map(&:capitalize).join(" ")
    end #end of name

    def rooms
        @rooms
    end #end of rooms

    def room_exists?(name)
        return true if rooms.has_key?(name) 
        return false
    end #end of room_exists?

    def check_in(name, room_name)
        if !self.room_exists?(room_name)
            p 'sorry, room does not exist'
        else
            if @rooms[room_name].add_occupant(name)
                p 'check in successful'
            else
                p 'sorry, room is full'
                return false
            end #end of add_occupant check
        end #end of if room exists
    end #end of check_in

    def has_vacancy?
        @rooms.values.any? {|room| room.available_space > 0}
    end #end of has_vacancy?

    def list_rooms
        @rooms.each do |room,space|
            puts "#{room} : #{space.available_space}"
        end 
           
    end #end of list_rooms

end #end of Hotel class
