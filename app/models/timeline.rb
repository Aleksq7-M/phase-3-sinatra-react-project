require 'date';
require 'time';
class Timeline < ActiveRecord::Base
    has_many :events

    #returns all events in a given month
    def month(year: , month: )

        date = DateTime.new(year, month, 1,0,0,0,-7)

        month_start = date.to_time.to_i
        month_end = (date >> 1).to_time.to_i

        events = self.events.where({event_start: month_start..month_end}).order(event_start: :asc)

        sorted_events = {}

        i = 1
        while i < 7
            sorted_events["week_#{i}"] = []
            i+=1
        end

        events.each do |event|
            week_num = (((event.event_start - leap_days(year))/604800).floor()) - ((days_given_year(year) + month_days(month))/7).floor()
            sorted_events["week_#{week_num}"] << (event)
        end

    end
end