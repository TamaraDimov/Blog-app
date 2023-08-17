require_relative './rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.create(
      Name: 'Loren',
      Photo: 'https://this-person-does-not-exist.com/en/download-page?image=genef4e9868ae582ca3061881b69d8fbeb1',
      Post_counter: 0,
      Bio: 'I am Loren, and I love sport.'
    )
  end

  let(:first_post) do
    Post.create(
      Title: 'My first post',
      author: user,
      Text: 'The motivation to become a developer is very big.',
      CommentsCounter: 0,
      LikesCounter: 0
    )
  end

  subject do
    Like.new(
      author: user,
      post: first_post
    )
  end

  before do
    subject.save
    first_post.update(LikesCounter: 0) # Reset LikesCounter to 0 before each test
  end

  describe 'Functionality' do
    context 'increment LikesCounter for post' do
      it 'increments the LikesCounter of the first_post' do
        expect { subject.send(:increment_likes_counter_for_post) }.to change { first_post.LikesCounter }.from(0).to(1)
      end
    end
  end
end
