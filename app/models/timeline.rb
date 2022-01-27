class Timeline < ActiveRecord::Base
    has_many :events

    def month_seconds(month)
        case month
        when 1
            return 0
        when 2
            return 31*86400
        when 3
            return (28*86400) + (31*86400)
        when 4
            return 2*(31*86400) + (28*86400)
        when 5
            return 30*86400 + 2*(31*86400) + (28*86400)
        when 6
            return 30*86400 + 3*(31*86400) + (28*86400)
        when 7
            return 2*(30*86400) + 3*(31*86400) + (28*86400)
        when 8
            return 2*(30*86400) + 4*(31*86400) + (28*86400)
        when 9
            return 2*(30*86400) + 5*(31*86400) + (28*86400)
        when 10
            return 3*(30*86400) + 5*(31*86400) + (28*86400)
        when 11
            return 3*(30*86400) + 6*(31*86400) + (28*86400)
        when 12
            return 4*(30*86400) + 6*(31*86400) + (28*86400)
        end
    end

    def month(year:, month: )
        month_start = 
        #seconds for the given year
        ((year-1970)*31536000 + 
        #seconds for the given month of that year
        self.month_seconds(month) + 
        #add leap days
        ((((year-1970)/4).floor())*86400) + 
        #and add exactly one day for reasons I cannot discern
        86400)

        

        month_end = 
        ((year-1970)*31536000 + 
        self.month_seconds(month + 1) + 
        ((((year-1970)/4).floor())*86400) + 
        86400)

        return self.events.where({event_start: month_start..month_end})
    end
end