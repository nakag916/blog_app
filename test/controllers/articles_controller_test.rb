require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_article_path
    assert_response :success
  end

  test "show" do
    a = :article_1
    get articles_path(a)
    assert_response :success
  end

end
