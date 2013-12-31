require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
   
   test "Should get index" do
   	session[:username] = "admin"
    get :index
    assert_not_nil assigns(:products)
    assert_response :success
  end

  test "Should get edit product page" do
   	session[:username] = "admin"
    get :edit, {"id" => 1}
    assert_not_nil assigns(:product)
    assert_response :success
  end

  test "Should update a product" do
   	session[:username] = "admin"
    post :updateProduct,{ :product =>
                      
                        	{:id => 1,
                        	 :name => 'Test',
                        	 :price => 35.00,
                        	 :product_type => 'addon' }
                     	
                     	}
    assert_not_nil assigns(:product)
    assert_response :redirect
  end

  test "Should load new products page" do
   	session[:username] = "admin"
    get :new
    assert_not_nil assigns(:product)
    assert_response :success
  end


  test "Should test creating a product" do
   	session[:username] = "admin"
    post :create,{ :product =>
                      
                        	{:id => 1,
                        	 :name => 'Test',
                        	 :price => 35.00,
                        	 :product_type => 'addon',
                        	 :recurring => 'yes',
                        	 :recurring_amount => 20.00 }
                     	
                     	}
    assert_not_nil assigns(:product)
    assert_response :redirect
  end

end
