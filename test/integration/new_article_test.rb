require 'test_helper'

class NewArticleTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create(username: "Paul", email: "paul@example.com", password: "password", admin: true)
  end
  
  test "get new article form and create new article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "Test New Article", 
      description: "This tests the new article creation feature"}
    end
    assert_template 'articles/show'
    assert_match "Test New Article", response.body
  end
end