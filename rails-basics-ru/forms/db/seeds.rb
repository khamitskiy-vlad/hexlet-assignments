# frozen_string_literal: true

10.times do
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs.join("\n"),
    summary: Faker::Lorem.paragraph
  )
end
