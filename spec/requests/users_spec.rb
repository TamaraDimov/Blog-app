require 'rails_helper'

describe 'get users from /users' do
  it 'returns a successful response' do
    get '/users'

    expect(response).to be_successful
    expect(response).to render_template(:index)
    expect(response.body).to include('<h1>List of users</h1>')
  end
end

describe 'get user details from /users/:id' do
  it 'returns a successful response and includes user info' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       post_counter: 0)
    get "/users/#{user.id}"

    expect(response).to be_successful
    expect(response.body).to include('<h2>This is info of selected user</h2>')
    expect(response).to render_template(:show)
  end
end
