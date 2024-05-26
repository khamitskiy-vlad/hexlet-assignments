5.times do
  tasks1 = Task.create(
    name: Faker::Lorem.question,
    creator: Faker::Name.name
  )

  tasks2 = Task.create(
    name: Faker::Lorem.question,
    description: Faker::Lorem.paragraph,
    creator: Faker::Name.name,
    performer: Faker::Name.name
  )
end
