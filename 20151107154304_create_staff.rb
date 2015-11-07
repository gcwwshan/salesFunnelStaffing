class CreateStaff < ActiveRecord::Migration
	def change 
		create_table :staffs do |s|
			s.string :name
			s.string :role
			s.string :sex
		end
	end
end

