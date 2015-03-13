15.times do
  Band.create!(name: Faker::App.name).save
end

150.times do
  Album.create!(name: Faker::App.name,
                band_id: rand(1..15),
                recording_type: ['studio', 'live', nil].sample).save
end

1500.times do
  Track.create!(name: Faker::App.name,
                album_id: rand(1..150),
                lyrics: Faker::Lorem.paragraph,
                track_type: Track::TRACK_TYPES.sample).save
end
