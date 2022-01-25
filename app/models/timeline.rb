class Timeline < ActiveRecord::Base
    has_many :events

    # def month(month:, )
    #     return self.events
    # end
end