# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example Admin",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456",
             role: "Administrator",
             login_id: 1000,
             activated: true,
             activated_at: Time.zone.now
           )
User.create!(name:  "Example DM1",
            email: "example@railstutorial.org",
            password:              "123456",
            password_confirmation: "123456",
            role: "Decision Maker",
            login_id: 1001,
            activated: true,
            activated_at: Time.zone.now
          )
User.create!(name:  "Example DM2",
            email: "example@railstutorial.org",
            password:              "123456",
            password_confirmation: "123456",
            role: "Decision Maker",
            login_id: 1002,
            activated: true,
            activated_at: Time.zone.now
          )
User.create!(name:  "Example VA1",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456",
             role: "Validator",
             login_id: 1003,
             activated: true,
             activated_at: Time.zone.now
           )
User.create!(name:  "Example VA2",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456",
             role: "Validator",
             login_id: 1004,
             activated: true,
             activated_at: Time.zone.now
           )
User.create!(name:  "pickle-rick",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456",
             role: "Validator",
             login_id: 1005,
             activated: false,
             # activated_at: Time.zone.now
           )
User.create!(name:  "pickle-morty",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456",
             role: "Validator",
             login_id: 1006,
             activated: true,
             activated_at: Time.zone.now
           )
User.create!(name:  "Example CR1",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456",
             role: "Company Representative",
             login_id: 1007,
             activated: true,
             activated_at: Time.zone.now
           )

User.create!(name:  "Example CR2",
             email: "example@railstutorial.org",
             password:              "123456",
             password_confirmation: "123456",
             role: "Company Representative",
             login_id: 1008,
             activated: true,
             activated_at: Time.zone.now
           )
Company.create!({user_id: 8})
Company.create!({user_id: 9})
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@treenewbee.com"
  password = "123456"
  role = "Company Representative"
  login_id = n+1009

  user = User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               role: role,
               login_id: login_id,
               activated: true,
               activated_at: Time.zone.now
             )

  Company.create!({user_id: user.id})
  if n > 0
    if n > 10
      user.company.update_attributes!(parent_id: n / 2)
    else
      user.company.update_attributes!(parent_id: 1)
    end
  end
end


categories =[{:name => 'Business', :weight_sum => 3, :weight => 2},
             {:name => 'Security', :weight_sum => 3, :weight => 2},
             {:name => 'Finance', :weight_sum => 3, :weight => 2},]

categories.each do |category|
  Category.create!(category)
end

#create question
subcategories =[{:name => 'Business_1', :weight_sum => 3, category_id:1, :weight => 1},
             {:name => 'Business_2', :weight_sum => 3, category_id:1, :weight => 1},
             {:name => 'Business_3', :weight_sum => 3, category_id:1, :weight => 1},
             {:name => 'Security_1', :weight_sum => 3, category_id:2, :weight => 1},
             {:name => 'Security_2', :weight_sum => 0, category_id:2, :weight => 1},
             {:name => 'Security_3', :weight_sum => 0, category_id:2, :weight => 1},
             {:name => 'Finance_1', :weight_sum => 0, category_id:3, :weight => 1},
             {:name => 'Finance_2', :weight_sum => 0, category_id:3, :weight => 1},
             {:name => 'Finance_3', :weight_sum => 0, category_id:3, :weight => 1},
             ]

subcategories.each do |subcategory|
  Subcategory.create!(subcategory)
end

questions = [{:name => 'Business_1_q1', :weight => 1, subcategory_id:1},
             {:name => 'Business_1_q2', :weight => 1, subcategory_id:1},
             {:name => 'Business_1_q3', :weight => 1, subcategory_id:1},
             {:name => 'Business_2_q1', :weight => 1, subcategory_id:2},
             {:name => 'Business_2_q2', :weight => 1, subcategory_id:2},
             {:name => 'Business_2_q3', :weight => 1, subcategory_id:2},
             {:name => 'Business_3_q1', :weight => 1, subcategory_id:3},
             {:name => 'Business_3_q2', :weight => 1, subcategory_id:3},
             {:name => 'Business_3_q3', :weight => 1, subcategory_id:3},
             {:name => 'Security_1_q1', :weight => 1, subcategory_id:4},
             {:name => 'Security_1_q2', :weight => 1, subcategory_id:4},
             {:name => 'Security_1_q3', :weight => 1, subcategory_id:4},
             ]

questions.each do |q|
  Question.create!(q)
end


3.times do |n|
  name = "scenario_#{n+1}"
  description = Faker::Lorem.sentence(5)
  Scenario.create!(name: name, description: description)
  20.times do |i|
    ScenarioWeight.create!(scenario_id: n+1, company_id: i+1, weight: 1)
  end
end





scales = [{:name => 'B trust level 0', :description => 'Something about this level', :category_id => 1, :level => 'N/A', :score => 0},
          {:name => 'B trust level 1', :description => 'Something about this level', :category_id => 1, :level => '1', :score => 0.1},
          {:name => 'B trust level 2', :description => 'Something about this level', :category_id => 1, :level => '2', :score => 0.2},
          {:name => 'B trust level 3', :description => 'Something about this level', :category_id => 1, :level => '3', :score => 0.3},
          {:name => 'B trust level 4', :description => 'Something about this level', :category_id => 1, :level => '4', :score => 0.4},
          {:name => 'B trust level 5', :description => 'Something about this level', :category_id => 1, :level => '5', :score => 0.5},
          {:name => 'B Insufficient',  :description => 'Something about this level', :category_id => 1, :level => 'Insufficient evidence', :score => 0},
          {:name => 'S trust level 0', :description => 'Something about this level', :category_id => 2, :level => 'N/A', :score => 0},
          {:name => 'S trust level 1', :description => 'Something about this level', :category_id => 2, :level => '1', :score => 0.1},
          {:name => 'S trust level 2', :description => 'Something about this level', :category_id => 2, :level => '2', :score => 0.2},
          {:name => 'S trust level 3', :description => 'Something about this level', :category_id => 2, :level => '3', :score => 0.3},
          {:name => 'S trust level 4', :description => 'Something about this level', :category_id => 2, :level => '4', :score => 0.4},
          {:name => 'S trust level 5', :description => 'Something about this level', :category_id => 2, :level => '5', :score => 0.5},
          {:name => 'S Insufficient',  :description => 'Something about this level', :category_id => 2, :level => 'Insufficient evidence', :score => 0},
          {:name => 'F trust level 0', :description => 'Something about this level', :category_id => 3, :level => 'N/A', :score => 0},
          {:name => 'F trust level 1', :description => 'Something about this level', :category_id => 3, :level => '1', :score => 0.1},
          {:name => 'F trust level 2', :description => 'Something about this level', :category_id => 3, :level => '2', :score => 0.2},
          {:name => 'F trust level 3', :description => 'Something about this level', :category_id => 3, :level => '3', :score => 0.3},
          {:name => 'F trust level 4', :description => 'Something about this level', :category_id => 3, :level => '4', :score => 0.4},
          {:name => 'F trust level 5', :description => 'Something about this level', :category_id => 3, :level => '5', :score => 0.5},
          {:name => 'F Insufficient',  :description => 'Something about this level', :category_id => 3, :level => 'Insufficient evidence', :score => 0}
        ]
scales.each do |s|
  Scale.create!(s)
end
