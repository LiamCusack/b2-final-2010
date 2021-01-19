require 'rails_helper'

describe 'Competition Show' do
  before :each do
    @hack = Competition.create!(name: "Ultimate Hacky Sack Battle Royal", location: "Siberia", sport: "Hacky Sack")
    @disco = Competition.create!(name: "Interpretive Dance: Disco to the Death pt 2: Electric Boogaloo", location: "The Moon", sport: "Dance Fighting")

    @stomp = @hack.teams.create!(hometown: "Boulder", nickname: "The Stompies")
    @bruh = @hack.teams.create!(hometown: "Portland", nickname: "The Enlightened Ones")
    @inf = @disco.teams.create!(hometown: "Longmont", nickname: "The Infernos")
    @trav = @disco.teams.create!(hometown: "Moscow", nickname: "Travolta Incarnate")

    @roy = @stomp.players.create!(name: "Roy Schneider", age: 100)
    @rob = @bruh.players.create!(name: "Robert Shaw", age: 90)
    @johny = @inf.players.create!(name: "John Boy Bravisimo", age: 67)
    @julia = @trav.players.create!(name: "The Juliette", age: 46)

    visit competition_index_path(@hack.id)
  end

  it 'should show the name/location/sport of the competition' do
    expect(page).to have_content(@hack.name)
    expect(page).to have_content(@hack.location)
    expect(page).to have_content(@hack.sport)
  end

  it 'should display all the information of the teams participating' do
    within("#team-#{@stomp.id}") do
      expect(page).to have_content(@stomp.nickname)
      expect(page).to have_content(@stomp.hometown)
    end
    within("#team-#{@bruh.id}") do
      expect(page).to have_content(@bruh.nickname)
      expect(page).to have_content(@bruh.hometown)
    end
  end
end
