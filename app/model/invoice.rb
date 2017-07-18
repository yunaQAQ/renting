class Invoice < ApplicationRecord
	has_many :line_items

	validates_presence_of	:start_date, :end_date, :due_date, :total

	def generate_line_items(start_date, end_date, unit_price, units)
			total = unit_price * units
			self.line_items.create!(start_date: start_date,
															end_date: end_date,
															unit_price: unit_price,
															units: units,
															total: total)
	end
end
