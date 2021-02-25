# en = ['a', 'b', 'c', 'd', 'e']
# num = ['1', '2', '3', '4', '5']

# double_array = en.map{|e|
#   num.map{|n|
#     e + '_' + n
#   }
# }

# array = double_array.flatten

week = ["Mon", "Tue", "Wed", "Thu", "Fri"]
time = [1, 2, 3, 4, 5]

75.times do
  lesson = Lesson.new(
    name: Faker::Educator.subject,
    professor: Faker::Name.unique.name,
    # period: array.sample,
    week: week.sample,
    time: time.sample,
    room: Faker::Address.building_number,
    content: Faker::Lorem.sentence(word_count: 100)
  )
  lesson.save!
end
