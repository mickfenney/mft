# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

puts 'DEFAULT USERS'
#user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
#puts 'user: ' << user.name
#user.confirm!
#user.save!

user = User.new(
  :name => ENV['ADMIN_NAME'].dup,
  :email => ENV['ADMIN_EMAIL'].dup,
  :password => ENV['ADMIN_PASSWORD'].dup,
  :password_confirmation => ENV['ADMIN_PASSWORD'].dup,
)
puts 'user: ' << user.name
user.skip_confirmation!
user.add_role :admin
user.save!


user = User.new(
  :name => 'Test User',
  :email => 'test@example.com',
  :password => 'testuser',
  :password_confirmation => 'testuser',
)
puts 'user: ' << user.name
user.skip_confirmation!
user.save!

user = User.new(
  :name => 'Docs User',
  :email => 'docs@example.com',
  :password => 'docsuser',
  :password_confirmation => 'docsuser',
)
puts 'user: ' << user.name
user.skip_confirmation!
user.add_role :docs
user.save!
