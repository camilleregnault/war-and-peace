# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "start"

Candidate.destroy_all
Candidate.create(name:'Kirby', popularity_points: 98, attack_strength: 180, 
                  remote_photo_url: "https://res.cloudinary.com/dabuecrzn/image/upload/v1568903138/qbizwicefw8aagi4vh9y.png")
Candidate.create(name:'Doctor Zoidberg', popularity_points: 30, attack_strength: 70, 
                  remote_photo_url: "https://res.cloudinary.com/dabuecrzn/image/upload/v1568903187/udjes1kecx8xxq7prs43.jpg")
Candidate.create(name:'Chuck Norris', popularity_points: 99, attack_strength: 180, 
                  remote_photo_url: "https://res.cloudinary.com/dabuecrzn/image/upload/v1568903904/koqcehgw7yufgrwsjjll.png")
Candidate.create(name:'Lisa Simpson', popularity_points: 35, attack_strength: 160, 
                  remote_photo_url: "https://res.cloudinary.com/dabuecrzn/image/upload/v1568904019/lhjescq6hflkjrajxl5g.png")
Candidate.create(name:'Arnold S.', popularity_points: 65, attack_strength: 170, 
                    remote_photo_url: "https://res.cloudinary.com/dabuecrzn/image/upload/v1568904019/lhjescq6hflkjrajxl5g.png")
Candidate.create(name:'Lulu', popularity_points: 70, attack_strength: 110, 
                  remote_photo_url: "https://res.cloudinary.com/dabuecrzn/image/upload/v1568904132/u4yr3x8igxaggixk1vru.png")


puts "end"
