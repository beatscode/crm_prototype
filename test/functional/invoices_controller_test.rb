require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase

  test "Should get show invoice view" do
    session[:username] = "admin"
    get :show, { :invoice_id => 1, :reseller_id => 8}
    assert_not_nil assigns(:invoice)
    assert_not_nil assigns(:invoice_id)
    assert_not_nil assigns(:reseller)
    assert_not_nil assigns(:details)
    assert_response :success
  end
  
end
