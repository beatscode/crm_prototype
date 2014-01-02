require 'integration_test_helper' 
 
class HomeTest < ActionController::IntegrationTest
 
	def login
	visit 'login'
	fill_in 'username', :with => 'mednet.it@mednet-tech.com'
	fill_in 'password', :with => 'MednetProd01'
	click_button 'Log in'
	end

	test "View app root URL" do
	page.set_rack_session(:username => 'admin')
	visit '/'
	assert page.has_content?('Resellers')
	assert page.has_content?('Reseller Logo')
	assert page.has_content?('Reseller Name')
	assert page.has_content?('Marketing Type')
	# save_and_open_page
	end

	test "Viewing resellers main page aka home page" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers/'
	assert page.has_content?('Resellers')
	assert page.has_content?('Reseller Logo')
	assert page.has_content?('Reseller Name')
	assert page.has_content?('Marketing Type')
	# save_and_open_page
	end

	test "Viewing resellers main page" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers/8'
	assert page.has_content?('Users')
	assert page.has_content?('Users Login History')
	assert page.has_content?('Invoices')
	# save_and_open_page
	end

	test "Click on a user to view detais" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers/8'
	first(:link, "testuser@mednet-tech.com").click
	assert page.has_content?('Viewing User')
	assert page.has_content?('Login History')
	assert page.has_content?('Viewing User: testuser@mednet-tech.com')
	# save_and_open_page
	end

	test "Click on edit user" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers/8'
	click_link('Edit User')
	assert page.has_content?('Editing User testuser@mednet-tech.com')
	# save_and_open_page
	end

	test "Click on view invoice" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers/8'
	click_link('View Invoice')
	assert page.has_content?('Invoice Details')
	assert page.has_content?('Total:')
	assert page.has_content?('Status:')
	assert page.has_content?('Invoice Note:')
	# save_and_open_page
	end

	test "Click on new reseller" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers'
	click_link('New Reseller')
	assert page.has_content?('Create a New Reseller')

	fill_in 'reseller_name', :with => 'Test Reseller'
	click_button 'Create'

	assert page.has_content?('Resellers')
	assert page.has_content?('Reseller Logo')
	assert page.has_content?('Reseller Name')
	assert page.has_content?('Marketing Type')
	# save_and_open_page
	end

	test "Click on coupons link" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers'
	click_link('Coupons')
	assert page.has_content?('Name')
	assert page.has_content?('Discount')
	assert page.has_content?('Description')

	click_link('Edit')
	fill_in 'coupon_name', :with => 'mednet30'
	

	click_button('Update')
	assert page.has_content?('Name')
	assert page.has_content?('Discount')
	assert page.has_content?('Description')

	click_link('Delete')
	assert page.has_content?('Name')
	assert page.has_content?('Discount')
	assert page.has_content?('Description')

	end

	test "Click on products link" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers'
	first(:link, "All Products").click
	assert page.has_content?('Products')
	assert page.has_content?('Edit')
	end


	test "Edit a product" do
	page.set_rack_session(:username => 'admin')
	visit '/products'
	click_link('Edit')
	assert page.has_content?('Update Product Details')
	fill_in 'product_name', :with => 'Test Product 2'
	click_button('Update')
	assert page.has_content?('Test Product 2')
	end


	test "Create a product" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers'
	first(:link, "New Product").click
	fill_in 'product_name', :with => 'Test Product 2'
	fill_in 'product_price', :with => '30'
	fill_in 'product_description', :with => 'This is a test product'
	click_button('Create')

	# We will be redirected back to the products page
	assert page.has_content?('Products')
	assert page.has_content?('Edit')
	assert page.has_content?('Test Product 2')
	# save_and_open_page
	end

	test "Check on a site" do
	page.set_rack_session(:username => 'admin')
	visit '/resellers/8'
	first(:link, "View Site").click

	assert page.has_content?('Details')
	assert page.has_content?('Domain')
	assert page.has_content?('Addon Products')
	assert page.has_content?('Standing : active')
	assert page.has_content?('Test invoice')
	# save_and_open_page
	end
 
end