# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TwitterCredential.delete_all
TwitterCredential.create!(
  consumer_key: "19kOvJk71cgwpriGwb9HmQ", 
  consumer_secret: "vYGJ4SbVVFbCqd2OJiRK7RziZJElhoMRiXDbPbWRYb8", 
  oauth_token: "770027-mPp5BLp69Qm60rfEe3AXPGcT8g9KJOwAjs4jGXeNf2I", 
  oauth_token_secret: "CA28EE1eZo18KaStNPzJDF3PVHM0hYVSvvULIS0axXc"
)