# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  
if Rails.env.development?

  office1 = Office.create(office_name: "Edmonton")
  office2 = Office.create(office_name: "Calgary")


  #fills employees table with dummy employees
  Employee.create(first_name: "Aaron", last_name: "Andrews", email: "Aaron@mail.com", phone: "1-800-555-1111", office: office1)
  Employee.create(first_name: "Bret", last_name: "Bean", email: "Bret@mail.com", phone: "1-800-555-2222", office: office1)
  Employee.create(first_name: "Charlie",last_name: "Chase", email: "Charlie@mail.com", phone: "1-800-555-3333", office: office1)
  Employee.create(first_name: "Dave", last_name: "Daniels", email: "Dave@mail.com", phone: "1-800-555-4444", office: office1)
  Employee.create(first_name: "Eric", last_name: "Ericson", email: "Eric@mail.com", phone: "1-800-555-5555", office: office1)
  Employee.create(first_name: "Fred", last_name: "Franklin", email: "Frank@mail.com", phone: "1-800-666-6666", office: office1)
  Employee.create(first_name: "Greg", last_name: "Andrews", email: "Aaron@mail.com", phone: "1-800-555-1111", office: office1)
  Employee.create(first_name: "Henry", last_name: "Bean", email: "Bret@mail.com", phone: "1-800-555-2222", office: office1)
  Employee.create(first_name: "Ivan",last_name: "Chase", email: "Charlie@mail.com", phone: "1-800-555-3333", office: office1)
  Employee.create(first_name: "Jerry", last_name: "Daniels", email: "Dave@mail.com", phone: "1-800-555-4444", office: office1)
  Employee.create(first_name: "Kevin", last_name: "Ericson", email: "Eric@mail.com", phone: "1-800-555-5555", office: office1)
  Employee.create(first_name: "Lamar", last_name: "Franklin", email: "Frank@mail.com", phone: "1-800-666-6666", office: office1)
  Employee.create(first_name: "Moe", last_name: "Whocares", email: "Moe@mail.com", phone:"1-111-111-1111", office: office1)

  #fill week table with 5 week starting Sept 4, 2017
  @current_time = DateTime.new(2017,9,4).beginning_of_week

  
  20.times do |i|
    Week.create(starts_at: @current_time)
    @current_time = @current_time.next_week.beginning_of_week 
  end

  #assigns two employees to a week in numerical order
  @emp_id = 1


  Week.find_each do |w|
    Assignment.create(week: w, employee: Employee.find(@emp_id), office: office1)
    @emp_id += 1
    if @emp_id > Employee.all.last.id
      @emp_id = 1
    end

    Assignment.create(week: w, employee: Employee.find(@emp_id), office: office1)
    @emp_id += 1
    if @emp_id > Employee.all.last.id
      @emp_id = 1
    end
  end

  User.create(email: "admin@mail.com", password: "123456", password_confirmation: "123456")

end