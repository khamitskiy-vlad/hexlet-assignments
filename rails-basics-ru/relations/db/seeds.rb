# frozen_string_literal: true

Status.create(
  name: %s(new)
)

Status.create(
  name: %s(in_progress)
)

Status.create(
  name: %s(done)
)

5.times do
  User.create(
    name: Faker::Name.name
  )
end
