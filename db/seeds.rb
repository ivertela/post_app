# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
	name: "User", email: "qwe@qwe.qwe",
	password: "qweqwe", password_confirmation: "qweqwe",
	avatar: File.open(Rails.root.join('test', 'fixtures', 'files', 'qwe.jpg') )
	)
user.update(confirmed_at: Time.current)