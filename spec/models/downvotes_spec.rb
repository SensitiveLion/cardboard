require 'rails_helper'
require 'helpers'

describe Downvote do
  let(:review) { FactoryGirl.create(:review) }
  let(:user) { FactoryGirl.create(:user) }

  describe 'score goes down by 1' do
    context 'user downvotes' do
      it 'downdates review downvote score' do
        expect(review.vote_count).to eq 0
        Downvote.vote_helper(:down, review, user)
        expect(review.vote_count).to eq(-1)
      end
    end
  end
  describe 'score goes back to zero' do
    context 'user downvotes a second time' do
      it 'cancels downvote' do
        expect(review.vote_count).to eq 0
        Downvote.vote_helper(:down, review, user)
        expect(review.vote_count).to eq(-1)
        Downvote.vote_helper(:down, review, user)
        expect(review.vote_count).to eq 0
      end
    end
  end
  describe 'score goes back to zero' do
    context 'user upvotes a downvote' do
      it 'creates upvote' do
        expect(review.vote_count).to eq 0
        Downvote.vote_helper(:down, review, user)
        expect(review.vote_count).to eq(-1)
        Upvote.vote_helper(:up, review, user)
        expect(review.vote_count).to eq 1
      end
    end
  end
end
