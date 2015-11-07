require 'sinatra'
require 'active_record'
require 'json'
# require 'rack/contrib'

# require 'pg'
require 'sqlite3'

require './model/staffs'

# use Rack::PostBodyContentTypeParser

env = ENV["ENV"] ? ENV["ENV"] : 'development'
dbconfig = YAML.load(ERB.new(File.read(File.join("config", "database.yml"))).result)
ActiveRecord::Base.establish_connection(dbconfig[env])

get '/staffs' do
  staffs = Staff.all || []
  staffs.to_json
end

# post '/staffs' do
# 	staff = Staff.create(:name => params[:name],
# 		:description => params[:description],
# 		:created_at => Time.now,
# 		:updated_at => Time.now)

# 	if staff.save
# 		[201, "/staffs/#{plant['id']}"]
# 	end
# end

# get '/staffs/:id' do
# 	staff = Staff.find(params[:id])
# 	staff.to_json
# end