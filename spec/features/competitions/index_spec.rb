require 'rails_helper'

describe 'Competition Index' do
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

    visit competition_index_path
  end

  it 'should display all the competitions' do
    within("#comp-#{@hack.id}") do
      expect(page).to have_content(@hack.name)
    end
    within("#comp-#{@disco.id}") do
      expect(page).to have_content(@disco.name)
    end
  end

  it 'should have rerouting links on all competitions names to their show page' do
    within("#comp-#{@hack.id}") do
      click_link "#{@hack.name}"
      expect(current_path).to eq(competition_path(@hack.id))
    end
    expect(page).to have_content(@hack.name)
    expect(page).to_not have_content(@disco.name)
  end
end
