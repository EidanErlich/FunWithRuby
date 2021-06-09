class Employee
    attr_accessor :name, :title

    def initialize(name, title)
        @name = name
        @title = title
        @earnings = 0
    end #end of initialize

    def pay(amount)
        @earnings+=amount
    end #end of pay



end #end of Employee class
