require 'sinatra'
require 'active_record'
require 'json'
require 'rack/contrib'

# require 'pg'
require 'sqlite3'

require './model/staffs'


use Rack::PostBodyContentTypeParser


# 下面三行必加 ？ 与rakefile 有重复
env = ENV["ENV"] ? ENV["ENV"] : 'development'  
dbconfig = YAML.load(ERB.new(File.read(File.join("config", "database.yml"))).result)
ActiveRecord::Base.establish_connection(dbconfig[env])

get '/staffs' do
  staffs = Staff.all || []
  staffs.to_json
end
	
# 左边的:name 是数据库里的字段
post '/staffs' do
	staff = Staff.create(:name => params[:name],
		:role => params[:role],
		:sex => params[:sex],
		)
		# :created_at => Time.now,
		# :updated_at => Time.now)

	# if staff.save     这条语句作用在哪里呢？
	# 	[201, "/staffs/#{staff['id']}"]
	# end
end

put '/staffs/:id' do
	staff = Staff.find(params[:id])
	# staff.update(name:"lixufei")
	# staff.sex = "female"
	staff.update(:name => params[:name],
		:role => params[:role],
		:sex => params[:sex], 
	)
	staff.to_json
end

delete '/staffs/:id' do
	staff = Staff.delete(params[:id])
	staff.to_json
end


get '/staffs/:id' do
	staff = Staff.find(params[:id])
	staff.to_json
end