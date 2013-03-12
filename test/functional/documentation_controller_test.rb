require 'test_helper'

class DocumentationControllerTest < ActionController::TestCase
  test "should get product_rule" do
    get :product_rule
    assert_response :success
  end

end
