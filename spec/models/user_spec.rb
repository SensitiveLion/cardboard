require 'rails_helper'
require 'helpers'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  describe 'can have first name, last name, location and age' do
    let(:user) { FactoryGirl.create(:user) }
    context 'user has optional abilities' do
      it 'has optional fields' do
        expect(user.first_name).to eq "person"
        expect(user.last_name).to eq "personson"
        expect(user.location).to eq "here"
        expect(user.age).to eq "20"
      end
    end
  end
  describe 'karma score shows xp' do
    let(:user) { FactoryGirl.create(:user) }
    context 'user karma score shows xp' do
      it 'shows xp' do
        expect(user.karma_score).to eq 0
      end
    end
  end
  describe 'user level shows level' do
    let(:user) { FactoryGirl.create(:user) }
    context 'user has level 0' do
      it 'shows level' do
        user.xp = 0
        expect(user.status).to eq "candyland newb"
      end
    end
    context 'user has level 1' do
      it 'shows level' do
        user.xp = 26
        expect(user.status).to eq "settler's apprentice"
      end
    end
    context 'user has level 2' do
      it 'shows level' do
        user.xp = 51
        expect(user.status).to eq "journeyman of puzzles"
      end
    end
    context 'user has level 3' do
      it 'shows level' do
        user.xp = 76
        expect(user.status).to eq "card shark"
      end
    end
    context 'user has level 4' do
      it 'shows level' do
        user.xp = 101
        expect(user.status).to eq "dominionator"
      end
    end
    context 'user has level 5' do
      it 'shows level' do
        user.xp = 151
        expect(user.status).to eq "game master"
      end
    end
  end
end
