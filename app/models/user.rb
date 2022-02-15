class User < ActiveRecord::Base
    has_many :events

    def events_range(range: , year: , month: , day: )
        case range
        when 'm'
            # return Event.month(year: year.to_i, month: month.to_i)
            Event.all.where(user_id: self.id).month(year: year.to_i, month: month.to_i)

        end
    end
end