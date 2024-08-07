# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Current.network = Network.create!(name: "Gamer Martial Arts")

School.create!(subdomain: "gat", name: "GMA Texas", timezone: "America/Chicago")
School.create!(subdomain: "gam", name: "GMA Missouri", timezone: "America/Chicago")

user = User.create!(email_address: "test@test.test", password: "test", password_confirmation: "test")
user.schools = School.all
user.save!

member = Member.create!(first_name: "Jeff", last_name: "Bezos", pin: 1111)
member.schools = School.all
member.save!

[ 2, 3, 4, 5 ].each do |i|
  MembershipTemplate.create!(name: "Fortnite #{i}x Monthly", end_behavior: "cancel", duration_type: "ongoing",
                             billing_type: "once", price: 19.0, attendance_type: "unlimited")
end
