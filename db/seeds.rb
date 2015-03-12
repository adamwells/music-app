10.times do
  Band.create!(name: Faker::App.name)
end

100.times do
  Album.create!(name: Faker::App.name, band_id: rand(1..10))
end
