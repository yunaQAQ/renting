class RentingPhase < ApplicationRecord
	belongs_to :contract

	validates_presence_of	:start_date, :end_date, :price, :cycles
end
