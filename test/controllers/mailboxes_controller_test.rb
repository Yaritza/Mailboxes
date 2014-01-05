require 'test_helper'

class MailboxesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
