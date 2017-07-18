class Contract < ApplicationRecord
	has_many :renting_phases

	validates_presence_of	:start_date, :end_date
end
