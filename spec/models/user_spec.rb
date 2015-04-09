require 'rails_helper'
require 'helpers'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  describe 'new user profile has attributes' do
    context 'user scoring' do
      it 'user has default XP and level status' do
        expect(user.karma_score).to eq 0
        expect(user.level).to eq 0
      end
    end
  end
end
