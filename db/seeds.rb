# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)

#Creating User Roles
['super administrator', 'administrator', 'teacher', 'student', 'guardian'].each do |r|
  Role.create(name: r)
end

#Creating Super Admin User
User.create(email: 'superadmin@eg.com', password: 'superpassword', role: Role.first)

#Creating Staff Departments
['Teaching', 'Accounting', 'Kitchen', 'Security', 'Other'].each do |name|
  StaffDepartment.create(name: name)
end
