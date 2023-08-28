require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'users list' do 
      visit 'users'
       assert_text "Lilly"
       assert_text "Tom"
  end
    test 'user profile image' do 
      visit 'users'
      assert_selector 'img[alt="User Photo"]'
  end
  test 'user name' do 
    visit 'users/1'
    assert_text "Tom"
end
test 'user number of posts' do 
    visit 'users/1'
    assert_text "Number of posts: 4"
end
test 'user bio' do 
    visit 'users/2'
    assert_text "Bio"
end
test 'user 3 posts' do 
    visit 'users/1'
    assert_selector 'div.card-body'
    assert_text "Post no.", count: 3
 end
test 'view all posts button' do 
    visit 'users/1'
    assert_text "Show all posts"
end
  test 'see all posts link' do 
      visit 'users/1'
      click_on "Show all posts"
      assert_current_path "/users/1/posts"
  end
  test 'show select post' do
    visit 'users/1/posts'
    click_on 'Post no. 4'
      assert_current_path "/users/1/posts/4"
  end
end