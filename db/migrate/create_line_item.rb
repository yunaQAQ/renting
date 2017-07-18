class CreateLineItems < ActiveRecord::Migration[5.0]
	def change
		create_table :line_items do |t|
			t.date :start_date
			t.date :end_date
			t.date :due_date
			t.float  :total
		end
	end
end
