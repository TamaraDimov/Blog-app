require_relative 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:first_user) do
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
      author: first_user,
      Text: 'The motivation to become a developer is very big.',
      CommentsCounter: 0,
      LikesCounter: 0
    )
  end

  subject do
    Comment.new(
      Text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      post: first_post,
      author: first_user
    )
  end

  before do
    subject.save
    first_post.update(CommentsCounter: 0)
  end

  describe 'Functionality' do
    context 'increment CommentsCounter for post' do
      it 'increments the CommentsCounter of the first_post' do
        expect { subject.send(:increment_comments_counter_for_post) }.to change {
                                                                           first_post.CommentsCounter
                                                                         }.from(0).to(1)
      end
    end
  end
end
