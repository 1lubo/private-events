# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([
                      { name: 'Mr. White' },
                      { name: 'Mr. Orange' },
                      { name: 'Mr. Blonde' },
                      { name: 'Mr. Pink' },
                      { name: 'Mr. Brown' }
                    ])

users.first.created_events.create([
                                    { name: 'First Meeting', date: '2022-10-01', location: 'Diner', description: "Let's analyse Madona's 'Like a Virgin' and proper tipping ettiquette." },
                                    { name: 'The Job', date: '2022-10-10', location: 'Jewelry store', description: "Let's look at some nice jewelry." },
                                    { name: 'Debrief', date: '2022-10-11', location: 'Warehouse', description: 'Lessons learned.' }
                                  ])

users[1].created_events.create([
                                 { name: 'Talking with Joe Cabot', date: '2021-06-12', location: "Joe's office", description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Morbi non arcu risus quis.' }
                               ])

users[2].created_events.create([
                                 { name: 'The Commodore Meeting', date: '2023-01-01', location: 'Nightclub', description: 'Varius sit amet mattis vulputate enim nulla aliquet porttitor. Sodales ut eu sem integer vitae justo eget magna fermentum.' }
                               ])

users[3].created_events.create([
                                 { name: 'New Years Party', date: '2000-01-01', location: 'Area 51', description: 'Eget sit amet tellus cras adipiscing.' }
                               ])

users[4].created_events.create([
                                 { name: 'Y2K', date: '1999-12-31', location: 'Central Park', description: 'Dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc. Consequat ac felis donec et odio pellentesque diam.' }
                               ])
