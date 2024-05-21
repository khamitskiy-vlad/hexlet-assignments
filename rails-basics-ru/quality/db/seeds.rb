5.times do |index|
  count = index + 1
  Bulletin.create(title: "Title #{count}", body: "Body #{count}", published: true)
end
