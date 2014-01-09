# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name: 'Fedor',
			surname: 'Fedorov',
			birthday: '1991-11-11',
			email: 'nightbober@yandex.ru',
			password: '12121212',
			admin: true)