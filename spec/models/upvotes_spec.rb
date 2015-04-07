require 'rails_helper'
require 'helpers'

describe Upvote do
  let(:review) { FactoryGirl.create(:review) }
  let(:user) { FactoryGirl.create(:user) }

  describe 'score goes up by 1' do
    context 'user upvotes' do
      it 'updates review upvote score' do
        expect(review.vote_count).to eq 0
        Upvote.vote_helper(:up, review, user)
        expect(review.vote_count).to eq 1
      end
    end
  end
  describe 'score goes back to zero' do
    context 'user upvotes a second time' do
      it 'cancels upvote' do
        expect(review.vote_count).to eq 0
        Upvote.vote_helper(:up, review, user)
        expect(review.vote_count).to eq 1
        Upvote.vote_helper(:up, review, user)
        expect(review.vote_count).to eq 0
      end
    end
  end
  describe 'score swaps with opposing vote' do
    context 'user downvotes an upvote' do
      it 'creates downvote' do
        expect(review.vote_count).to eq 0
        Upvote.vote_helper(:up, review, user)
        expect(review.vote_count).to eq(1)
        Downvote.vote_helper(:down, review, user)
        expect(review.vote_count).to eq(-1)
      end
    end
  end
end
