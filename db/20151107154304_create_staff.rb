class CreateStaff < ActiveRecord::Migration
	def change 
		create_table :staffs do |s|
			s.string :name
			s.string :role
			s.string :sex
			# s.timestamps
		end
	end
end

