class Invoice < ApplicationRecord
	has_many :line_items

	validates_presence_of	:start_date, :end_date, :due_date, :total

	def generate_line_items(unit_price, units)
			self.line_items.create!(start_date: self.start_date,
															end_date: self.end_date,
															unit_price: unit_price,
															units: units,
															total: self.total)
	end
end
