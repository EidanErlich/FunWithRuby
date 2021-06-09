require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end #end of initialize

    def valid_title?(title)
        return true if salaries.has_key?(title)
        return false
    end #end of valid_title?

    def >(startup)
        return true if self.funding > startup.funding
        return false
    end #end of >

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise_error
        end
    end #end of hire

    def size
        @employees.length
    end #end of size

    def pay_employee(employee)
        monney_owed = @salaries[employee.title]
        if @funding > monney_owed
            employee.pay(monney_owed)
            @funding-=monney_owed
        else
            raise_error
        end
    end #end of pay_employee

    def payday
        employees.each do |name|
            pay_employee(name)
        end
    end #end of payday

    def average_salary
        sum = 0
        @employees.each do |name|
            sum += @salaries[name.title]
        end
        sum / @employees.length
    end #end of average_salary

    def close
        @employees = []
        @funding = 0
    end #end of close

    def acquire(startup)
        @funding+=startup.funding
        startup.salaries.each do |k,v|
            if !salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        startup.employees.each do |name|
            @employees << name
        end
        startup.close
    end #end of acquire

end #end of Startup Class
