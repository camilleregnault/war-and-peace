# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "start"

Candidate.destroy_all
Candidate.create(name: 'Kirby', popularity_points: 98, attack_strength: 25,
                  remote_photo_url: 'https://res.cloudinary.com/dabuecrzn/image/upload/v1568905770/king_kirby_zzhpgz.png')
Candidate.create(name: 'Doctor Zoidberg', popularity_points: 40, attack_strength: 10,
                  remote_photo_url: 'https://res.cloudinary.com/dabuecrzn/image/upload/v1568905770/zoidberg_campaign_jet8pu.jpg')
Candidate.create(name: 'Chuck Norris', popularity_points: 99, attack_strength: 24,
                  remote_photo_url: 'https://res.cloudinary.com/dabuecrzn/image/upload/v1568905770/chuck_norris_PNG8_dvtq06.png')
Candidate.create(name: 'Lisa Simpson', popularity_points: 55, attack_strength: 16,
                  remote_photo_url: 'https://res.cloudinary.com/dabuecrzn/image/upload/v1568905770/Lisa-Simpson-icon_ptgeru.png')
Candidate.create(name: 'Arnold S.', popularity_points: 65, attack_strength: 17,
                    remote_photo_url: 'https://res.cloudinary.com/dabuecrzn/image/upload/v1568905770/schwarzy_head_fwmhog.png')
Candidate.create(name: 'Lulu', popularity_points: 70, attack_strength: 11, 
                  remote_photo_url: 'https://res.cloudinary.com/dabuecrzn/image/upload/v1568905771/FFX_Lulu_Art_veoq8o.png')

Weapon.destroy_all
Weapon.create(name: 'conseillé en communication', attack: 10, defence: 0)
Weapon.create(name: 'journal à scandale', attack: 5, defence: 5)
Weapon.create(name: 'financement de campagne', attack: 0, defence: 20)
Weapon.create(name: 'institut de sondage', attack: 1, defence: 15)

puts "end"