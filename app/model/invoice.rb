class Invoice < ApplicationRecord
	has_many :line_items

	validates_presence_of	:start_date, :end_date, :due_date, :total
end
