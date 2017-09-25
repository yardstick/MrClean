# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

	#fills employees table with dummy employees

	Employee.create(first_name: "Aaron", last_name: "Andrews", email: "Aaron@mail.com", phone: "1-800-555-1111")
	Employee.create(first_name: "Bret", last_name: "Bean", email: "Bret@mail.com", phone: "1-800-555-2222")
	Employee.create(first_name: "Charlie",last_name: "Chase", email: "Charlie@mail.com", phone: "1-800-555-3333")
	Employee.create(first_name: "Dave", last_name: "Daniels", email: "Dave@mail.com", phone: "1-800-555-4444")
	Employee.create(first_name: "Eric", last_name: "Ericson", email: "Eric@mail.com", phone: "1-800-555-5555")


	Schedule.create(start_year: 2017, start_month: 9, start_day: 3, employee1: Employee.find(1) , employee2: Employee.find(2))
	Schedule.create(start_year: 2017, start_month: 9, start_day: 3, employee1: Employee.find(1) , employee2: Employee.find(2))	
	Schedule.create(start_year: 2017, start_month: 9, start_day: 10, employee1: Employee.find(3), employee2: Employee.find(4))
	Schedule.create(start_year: 2017, start_month: 9, start_day: 17, employee1: Employee.find(5), employee2: Employee.find(1))
	Schedule.create(start_year: 2017, start_month: 9, start_day: 24, employee1: Employee.find(2), employee2: Employee.find(3))
	