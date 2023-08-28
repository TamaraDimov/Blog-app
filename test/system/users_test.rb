require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'users list' do 
      visit 'users'
       assert_text "Lilly"
       assert_text "Tom"
  end
end
  #   test 'user profile image' do 
  #     visit 'users'
  #     assert_selector 'img[alt="User Photo"]'
  # end
#   test 'user name' do 
#     visit 'users/1'
#     assert_text "Tom"
# end
# test 'user number of posts' do 
#     visit 'users/1'
#     assert_text "Number of posts: 6"
# end
# test 'user bio' do 
#     visit 'users/2'
#     assert_text "Bio"
# end
# test 'user first 3 posts' do 
#     visit 'users/2'
#     assert_text "xx", count: 3
# end
# test 'view all posts button' do 
#     visit 'users/2'
#     assert_text "See all posts"
# end
# test 'user post link' do 
#     visit 'users/2'
#     click_on "See all posts"
#     assert_text "Post"
# end
# test 'see all post link' do
#   visit 'users/1'
#   click_on 'See all posts'
#   assert_text 'List of Posts'
# end
# end