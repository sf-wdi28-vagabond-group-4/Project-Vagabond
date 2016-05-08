12.times do
	title = FFaker::Lorem.sentence
  content = FFaker::Lorem.paragraph
  user_id = rand(4) + 1
  Post.create({title: title, content: content, city_id: 1, user_id: user_id})
end
