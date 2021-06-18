class ComputerPlayer
    attr_reader :mark

    def initialize(val)
        @mark = val
    end

    def get_position(legal_positions)
        choice = legal_positions.sample
        puts "Le Computer #{self.mark} hath chosen #{choice.to_s}"
        choice
    end
end #end of class