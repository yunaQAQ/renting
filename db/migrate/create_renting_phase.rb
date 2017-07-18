class CreateRentingPhases < ActiveRecord::Migration[5.0]
	def change
		create_table :renting_phases do |t|
			t.date :start_date
			t.date :end_date
			t.float  :price
			t.integer  :cycles
			t.references :contract, index: true, foreign_key: true
		end
	end
end
