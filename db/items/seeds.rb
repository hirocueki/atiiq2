user = User.find_or_initialize_by(email: 'users@example.com')
if user.new_record?
  user.password = '111111'
  user.password_confirmation = '111111'
  user.save!
end

10.times do |n|
  user.items.create!(title: "Test Item #{n}", content: "Test Content 1.#{n}")
end
