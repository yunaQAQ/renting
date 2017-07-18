class Contract < ApplicationRecord
	has_many :renting_phases

	validates_presence_of	:start_date, :end_date

	# eg:
	# Contract.generate_contract({
	# 	'start_date' => '2016-08-05',
	# 	'end_date' => '2016-12-10',
	# 	'renting_phases_attributes' => {
	# 		'0' => {
	# 			'start_date' => '2016-08-05',
	# 			'end_date' => '2016-10-04',
	# 			'price' => '1000',
	# 			'cycles' => '1'
	# 		},
	# 		'1' => {
	# 			'start_date' => '2016-10-05',
	# 			'end_date' => '2016-12-10',
	# 			'price' => '1200',
	# 			'cycles' => '1'
	# 		}
	# 	}
	# })
	def self.generate_contract(contract_params)
		Contract.create(contract_params)
	end
	
end
