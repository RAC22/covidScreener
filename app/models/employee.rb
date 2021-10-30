class Employee < ApplicationRecord
    belongs_to :user

    def self.search(search)
        if search
            employeename = Employee.find_by(first_name: search)
            if employeename
                self.where(id: employeename)
            else
                @employees = Employee.all
            end
        else
            @employees = Employee.all
        end
    end
    
end
