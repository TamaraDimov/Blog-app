require_relative 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      Name: 'Loren',
      Photo: 'https://this-person-does-not-exist.com/en/download-page?image=genef4e9868ae582ca3061881b69d8fbeb1',
      Post_counter: 0,
      Bio: 'I am Loren, and I love sport.'
    )
  end

  subject do
    Post.new(
      Title: 'My first post',
      author: user,
      Text: 'The motivation to become a developer is very big.',
      CommentsCounter: 0,
      LikesCounter: 0
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.Title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a title longer than 250 characters' do
      subject.Title = 'A' * 251
      expect(subject).to_not be_valid
    end

    it 'is not valid with a negative CommentsCounter' do
      subject.CommentsCounter = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid with a negative LikesCounter' do
      subject.LikesCounter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Functionality' do
    context 'increment post_counter for user' do
      it 'increments the post_counter of the author' do
        expect { subject.send(:increment_post_counter_for_user) }.to change { user.Post_counter }.from(0).to(1)
      end
    end
  end
end
