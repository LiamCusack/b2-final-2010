# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SeasonSchedule.destroy_all
Player.destroy_all
Team.destroy_all
Competition.destroy_all


@hack = Competition.create!(name: "Ultimate Hacky Sack Battle Royal", location: "Siberia", sport: "Hacky Sack")
@disco = Competition.create!(name: "Interpretive Dance: Disco to the Death pt 2: Electric Boogaloo", location: "The Moon", sport: "Dance Fighting")

@stomp = @hack.teams.create!(hometown: "Boulder", nickname: "The Stompies")
@bruh = @hack.teams.create!(hometown: "Portland", nickname: "The Enlightened Ones")
@inf = @disco.teams.create!(hometown: "Longmont", nickname: "The Infernos")
@trav = @disco.teams.create!(hometown: "Moscow", nickname: "Travolta Incarnate")

@roy = @stomp.players.create!(name: "Roy Schneider", age: 100)
@rob = @bruh.players.create!(name: "Robert Shaw", age: 90)
@johny = @inf.players.create!(name: "John Boy Bravisimo", age: 66)
@julia = @trav.players.create!(name: "The Juliette", age: 46)
@oblig = @trav.players.create!(name: "OBLIGATORY TEST PERSON YES THIS IS MY REAL NAME ALL CAPS", age: 43)
