require 'application_system_test_case'
class PostsTest < ApplicationSystemTestCase
  test 'user profile image' do
    visit 'users/1/posts'
    assert_selector 'img[alt="User Photo"]'
  end
  test 'user name' do
    visit 'users/1/posts'
    assert_text 'Tom'
  end
  test 'user number of posts' do
    visit 'users/1/posts'
    assert_text 'Number of posts: 4', count: 1
  end
  test 'a post title' do
    visit 'users/1/posts'
    assert_text 'Post no. 1'
    assert_selector 'h5.card-title'
  end
  test 'a post text' do
    visit 'users/1/posts'
    assert_text 'This is'
  end
  test 'first 5 comments' do
    visit 'users/1/posts'
    assert_selector 'div.container', maximum: 5
  end
  test 'post comments number' do
    visit 'users/1/posts'
    assert_text 'Comments: 5'
  end
  test 'view pagination' do
    visit 'users/1/posts'
    assert_text 'Pagination'
  end
  test 'selected post link' do
    visit 'users/1/posts'
    click_on 'Post no. 1'
    assert_current_path '/users/1/posts/1'
  end
  test 'post title' do
    visit 'users/1/posts/1'
    assert_text 'Post no. 1'
    assert_selector 'h5.card-title'
  end
  test 'post writer' do
    visit 'users/1/posts/1'
    assert_text 'by Tom'
  end
  test 'post comments number in the post view page' do
    visit 'users/1/posts/1'
    assert_text 'Comments: 5'
  end
  test 'post likes number' do
    visit 'users/1/posts/1'
    assert_text 'Likes: 0'
  end
  test 'post body' do
    visit 'users/1/posts/1'
    assert_selector 'div'
    assert_text 'This is my first post.'
  end
  test 'post commentors' do
    visit 'users/1/posts/1'
    assert_text 'Lilly'
  end
  test 'post comments' do
    visit 'users/1/posts/1'
    assert_text 'Lilly: Hi Tom!'
    assert_text 'Lilly: Hi Tom,how are you?!'
    assert_text 'Lilly: nice job!'
    assert_text 'Lilly: hope it works'
    assert_text 'Lilly: Hi Tom!'
  end
end
