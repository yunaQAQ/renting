class LineItem < ApplicationRecord
	belongs_to :invoice

	validates_presence_of	:start_date, :end_date, :unit_price, :units, :total
end
