require_relative './rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      Name: 'Loren',
      Photo: 'https://this-person-does-not-exist.com/en/download-page?image=genef4e9868ae582ca3061881b69d8fbeb1',
      Post_counter: 0,
      Bio: 'I am Loren, and I love sport.'
    )
  end

  before { subject.save }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.Name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with negative posts_counter' do
      subject.Post_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Functionality' do
    context 'get recent posts' do
      it 'returns the 3 most recent posts' do
        5.times do |i|
          Post.create(
            Title: "Post #{i}",
            author: subject,
            Text: 'The motivation to become a developer is very big.',
            CommentsCounter: 0,
            LikesCounter: 0
          )
        end

        expect(subject.recent_post.count).to eq(3)
      end
    end
  end
end
