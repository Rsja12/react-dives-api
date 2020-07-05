# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

User.create(name: 'John', email: 'userOne@email.com', password: 'password')

Divelog.create(user_id: 1, location: 'Grand Cayman', divesite: 'North Wall', max_depth: 110, bottom_time: 25, visibility: 100, water_temp: 83, weight: 8, notes: 'Great dive with awesome visibility. There was a strong current in the first 40ft, but it calmed down after that. Saw lots of sharks.')
Divelog.create(user_id: 1, location: 'Grand Cayman', divesite: 'Kittiwake', max_depth: 55, bottom_time: 45, visibility: 100, water_temp: 80, weight: 8, notes: 'Awesome wreck dive. Very disorienting inside of the wreck')
