require 'date';
require 'time';

class Event < ActiveRecord::Base
    belongs_to :timeline

    MONTH_LENGTHS = [
        nil,
        31,
        28,
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31
    ]

    def self.month_accrual(month)
        case month
        when 1
            return 0
        when 2
            return 31
        when 3
            return 59
        when 4
            return 90
        when 5
            return 120
        when 6
            return 151
        when 7
            return 181
        when 8
            return 212
        when 9
            return 243
        when 10
            return 273
        when 11
            return 304
        when 12
            return 334
        end
    end
    #returns all events in a given month, sorted by days
    ##WILL return events in a generalized range after future restructure
    def self.month(year: , month: )

        date = DateTime.new(year, month, 1,0,0,0,-7)

        month_start = date.to_time.to_i
        month_end = (date >> 1).to_time.to_i

        events = self.all.where({event_start: month_start..month_end}).order(event_start: :asc)

        sorted_events = {}

        i = 1
        while i < MONTH_LENGTHS[month] + 1
            sorted_events["day_#{i}"] = []
            i+=1
        end

        events.each do |event|
            day_num = ((event.event_start/86400).floor) - ((year-1970)*365) - ((year-1970)/4).floor - month_accrual(month)
            if (sorted_events["day_#{day_num}"].respond_to?(:push))
                sorted_events["day_#{day_num}"].push(event)
            end
        end

        return sorted_events

    end
end