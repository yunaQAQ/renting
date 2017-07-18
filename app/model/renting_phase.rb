class RentingPhase < ApplicationRecord
	belongs_to :contract

	validates_presence_of	:start_date, :end_date, :price, :cycles

	# after_create :generate_invoices

	def generate_invoices
		cycles_num = self.cycles
		invoice_start_date = self.start_date
		invoice_total = self.price * cycles_num
		loop do
			invoice_end_date = invoice_start_date + cycles_num.month - 1.day
			invoice_due_date = invoice_start_date.beginning_of_month - 1.month + 14.day
			if invoice_end_date < self.end_date
				invovice = Invoice.create(start_date: invoice_start_date,
											 						end_date: invoice_end_date,
											 						due_date: invoice_due_date,
											 						total: invoice_total)
				invovice.generate_line_items(invoice_start_date, invoice_end_date, self.price, cycles_num)
				invoice_start_date = invoice_end_date
			else
				month_num = months_between_two_dates(invoice_start_date, self.end_date)
				date_num = (self.end_date - month_num.month + 1.day - invoice_start_date).to_i
				day_rent = self.price * 12 / 365.0
				invoice_total = (self.price * month_num) + date_num * day_rent
				invovice = Invoice.create(start_date: invoice_start_date,
											 						end_date: self.end_date,
											 						due_date: invoice_due_date,
											 						total: invoice_total)
				line_item_end_date = invoice_start_date + month_num.month - 1.day
				invovice.generate_line_items(invoice_start_date, line_item_end_date, self.price, month_num)
				line_item_start_date = line_item_end_date + 1.day
				invovice.generate_line_items(line_item_start_date, self.end_date, day_rent, date_num)
				break
			end
		end
	end

	protected

		# date2 > date1
		def months_between_two_dates(date1, date2)
			(date2.year - date1.year) * 12 + date2.month - date1.month - ((date2.day - 1) >= date1.day ? 0 : 1)
		end

		# date2 > date1
		def is_complete_month(date1, date2)
			date2 > date1 and date1.day - date2.day == 1
		end
end
