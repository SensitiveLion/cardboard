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
  describe 'has required fields for user' do
    let(:user) { FactoryGirl.create(:user) }
    context 'user has email and username' do
      it 'has required fields' do
        n = user.username.last
        expect(user.email).to eq "user#{n}@example.com"
        expect(user.username).to eq "user#{n}"
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
    context 'user has level' do
      it 'shows level' do
        expect(user.status).to eq "candyland newb"
      end
    end
  end
end
