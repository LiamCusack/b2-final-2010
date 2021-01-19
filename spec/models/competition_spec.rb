require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_many :season_schedules }
    it { should have_many(:teams).through(:season_schedules) }
    it { should have_many(:players).through(:teams) }
  end

  describe 'instance methods' do
    before :each do
      @hack = Competition.create!(name: "Ultimate Hacky Sack Battle Royal", location: "Siberia", sport: "Hacky Sack")
      @disco1 = Competition.create!(name: "Interpretive Dance: Disco to the Death pt 2: Electric Boogaloo", location: "The Moon", sport: "Dance Fighting")

      @stomp = @hack.teams.create!(hometown: "Boulder", nickname: "The Stompies")
      @bruh = @hack.teams.create!(hometown: "Portland", nickname: "The Enlightened Ones")
      @inf = @disco1.teams.create!(hometown: "Longmont", nickname: "The Infernos")
      @trav = @disco1.teams.create!(hometown: "Moscow", nickname: "Travolta Incarnate")

      @roy = @stomp.players.create!(name: "Roy Schneider", age: 100)
      @rob = @bruh.players.create!(name: "Robert Shaw", age: 90)
      @johny = @inf.players.create!(name: "John Boy Bravisimo", age: 68)
      @julia = @trav.players.create!(name: "The Juliette", age: 46)
      @oblig = @trav.players.create!(name: "OBLIGATORY TEST PERSON YES THIS IS MY REAL NAME ALL CAPS", age: 43)
    end

    it 'average_player_age' do
      expect(@disco1.average_player_age.round(1)).to eq(52.3)
    end
  end
end
