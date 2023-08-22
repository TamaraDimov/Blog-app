require 'rails_helper'

describe 'Get all posts from user' do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 0) }

  it 'returns a successful response' do
    get "/users/#{user.id}/posts"

    expect(response).to be_successful
    expect(response.body).to include('<h2>This is a list of posts from selected user</h2>')
    expect(response).to render_template(:index)
  end
end

describe 'Get specific post from user' do
  let(:user) { User.create!(name: 'Test User', post_counter: 0) }

  it 'returns a successful response' do
    post = Post.create!(title: 'Test Post', author_id: user.id, commentsCounter: 0, likesCounter: 0)
    get "/users/#{user.id}/posts/#{post.id}"

    expect(response).to be_successful
    expect(response.body).to include('<h2>This is one post from user!</h2>')
    expect(response).to render_template(:show)
  end
end