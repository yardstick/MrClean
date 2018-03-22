# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Rails.env.development?

  office1 = Office.create(name: "Edmonton", num_assignments_per_week: 2)
  office2 = Office.create(name: "Calgary", num_assignments_per_week: 1)


  #fills employees table with dummy employees
  Employee.create(first_name: "Aaron", last_name: "Andrews", email: "Aaron@mail.com", office: office1)
  Employee.create(first_name: "Bret", last_name: "Bean", email: "Bret@mail.com", office: office1)
  Employee.create(first_name: "Charlie",last_name: "Chase", email: "Charlie@mail.com", office: office1)
  Employee.create(first_name: "Dave", last_name: "Daniels", email: "Dave@mail.com", office: office1)
  Employee.create(first_name: "Eric", last_name: "Ericson", email: "Eric@mail.com", office: office1)
  Employee.create(first_name: "Fred", last_name: "Franklin", email: "Frank@mail.com", office: office1)
  Employee.create(first_name: "Greg", last_name: "Andrews", email: "Aaron@mail.com", office: office1)
  Employee.create(first_name: "Henry", last_name: "Bean", email: "Bret@mail.com", office: office1)
  Employee.create(first_name: "Ivan",last_name: "Chase", email: "Charlie@mail.com", office: office1)
  Employee.create(first_name: "Jerry", last_name: "Daniels", email: "Dave@mail.com", office: office1)
  Employee.create(first_name: "Kevin", last_name: "Ericson", email: "Eric@mail.com", office: office1)
  Employee.create(first_name: "Lamar", last_name: "Franklin", email: "Frank@mail.com", office: office1)
  Employee.create(first_name: "Moe", last_name: "Whocares", email: "Moe@mail.com", office: office1)
  Employee.create(first_name: "Ned", last_name: "Andrews", email: "Aaron@mail.com", office: office1)
  Employee.create(first_name: "Omar", last_name: "Bean", email: "Bret@mail.com", office: office1)
  Employee.create(first_name: "Patty",last_name: "Chase", email: "Charlie@mail.com", office: office1)
  Employee.create(first_name: "Red", last_name: "Daniels", email: "Dave@mail.com", office: office1)
  Employee.create(first_name: "Sarah", last_name: "Ericson", email: "Eric@mail.com", office: office1)
  Employee.create(first_name: "Ted", last_name: "Franklin", email: "Frank@mail.com", office: office1)
  Employee.create(first_name: "U-name", last_name: "Andrews", email: "Aaron@mail.com", office: office1)
  Employee.create(first_name: "Vince", last_name: "Bean", email: "Bret@mail.com", office: office1)
  Employee.create(first_name: "Wendy",last_name: "Chase", email: "Charlie@mail.com", office: office1)
  Employee.create(first_name: "Xavier", last_name: "Daniels", email: "Dave@mail.com", office: office1)
  Employee.create(first_name: "Q", last_name: "Ericson", email: "Eric@mail.com", office: office1)
  Employee.create(first_name: "Y", last_name: "Franklin", email: "Frank@mail.com", office: office1)
  Employee.create(first_name: "Z", last_name: "Whocares", email: "Moe@mail.com", office: office1)


  User.create(email: "admin@mail.com", password: "123456", password_confirmation: "123456")

end
