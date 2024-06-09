# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Importing users from CSV files'
  task :import_users, [:path] => :environment do |_t, args|
    file_path = args[:path]
    data = CSV.foreach(file_path, headers: true).map(&:to_h)
    data.each do |d|
      user_birthday = Date.strptime(d['birthday'], '%m/%d/%Y')
      User.create(
        first_name: d['first_name'],
        last_name: d['last_name'],
        birthday: user_birthday,
        email: d['email']
      )
    end
  end
end
