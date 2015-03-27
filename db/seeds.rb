# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['stylist', 'client', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

admin_role = Role.find_by_name('admin');
stylist_role = Role.find_by_name('stylist');

admin_user = User.create(
    email: 'admin@wardrobetherapyllc.com',
    password: 'password',
    password_confirmation: 'password'
)

admin_user.roles = [admin_role]
admin_user.save

admin_user2 = User.create(
    email: 'elizabeth@wardrobetherapyllc.com',
    password: 'password',
    password_confirmation: 'password'
)

admin_user2.roles = [admin_role]
admin_user2.save

admin_user3 = User.create(
    email: 'michelle@wardrobetherapyllc.com',
    password: 'password',
    password_confirmation: 'password'
)

admin_user3.roles = [admin_role]
admin_user3.save

stylist_user1 = User.create(
    email: 'alic@wardrobetherapyllc.com',
    password: 'password',
    password_confirmation: 'password'
)

stylist_user1.roles = [stylist_role]
stylist_user1.save

stylist_user2 = User.create(
    email: 'christyw@wardrobetherapyllc.com',
    password: 'password',
    password_confirmation: 'password'
)

stylist_user2.roles = [stylist_role]
stylist_user2.save


stylist_user3 = User.create(
    email: 'allisonm@wardrobetherapyllc.com',
    password: 'password',
    password_confirmation: 'password'
)

stylist_user3.roles = [stylist_role]
stylist_user3.save
