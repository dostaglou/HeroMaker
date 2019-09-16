User.destroy_all if Rails.env.development?
Race.destroy_all if Rails.env.development?
Gender.destroy_all if Rails.env.development?
Profession.destroy_all if Rails.env.development?
Biography.destroy_all if Rails.env.development?
Table.destroy_all if Rails.env.development?
TableUserJoin.destroy_all if Rails.env.development?
puts "Post destory"
races =
  %w[human dwarf elf half-elf hobbit orc half-orc tiefling dragonborn assimar].sort
genders =
  %w[male female non-binary other]
professions =
  %w[fighter soldier medic priest shaman monk knight sorcerer mage alchemist herbalist doctor sage scholar thief assassin tracker woodsman charlatan entertainer, musician].sort
users =
  %w[Dillon Pat Wyatt]
tables =
  %w[dungeons dragons wizards warriors]

races.each do |x|
  one = Race.new(race: x)
  one.save!
end
genders.each do |x|
  one = Gender.new(gender: x)
  one.save!
end

professions.each do |x|
  one = Profession.new(job: x)
  one.save!
end

tables.each do |x|
  one = Table.new(name: x)
  one.save!
  end

users.each do |x|
  one = User.new(
    username: x,
    password: 123123,
    email: "#{x}@gmail.com"
  )
  one.save!
  rand(2..6).times do
    char = Character.new(
      name: Faker::Movies::LordOfTheRings.character,
      description: 'Tall dark and mysterious. From a world unknown to us all and with an appetite for violence that would shock even the vilest of murderers',
      allies: Faker::Movies::LordOfTheRings.character,
      enemies: Faker::Movies::LordOfTheRings.character,
      user_id: one.id,
      race_id: 1,
      gender_id: 1,
      profession_id: 1
    )
    char.save!
    puts  "post char.save"
    rand(1..4).times do
      history = Biography.new(
        title: Faker::Books::Lovecraft.tome,
        chapter: Faker::Books::Lovecraft.paragraphs(number: rand(2..5))
        )
      history.character_id = char.id
      history.save!
    end
  end
  rand(2..6).times do
    story = Story.new(
      title: Faker::Books::Lovecraft.tome,
      content: Faker::Books::Lovecraft.paragraphs(number: rand(2..5)),
      user_id: one.id
      )
    story.save!
  puts ("post story.save")
  end
  rand(1..3).times do
    puts ("pre table user join")
    table = TableUserJoin.new(
      user_id: one.id,
      table_id: rand(1..4)
      )
    table.save!
  end
end
