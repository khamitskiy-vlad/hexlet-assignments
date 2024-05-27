# frozen_string_literal: true

10.times do
  Task.create(
    name: Faker::Lorem.question,
    creator: Faker::Name.name
  )

  Task.create(
    name: Faker::Lorem.question,
    description: Faker::Lorem.paragraph,
    creator: Faker::Name.name,
    performer: Faker::Name.name
  )
end
