require_relative '../spec_helper'
expectedURL = "https://core-dev.cspace.berkeley.edu/cspace/core/create"
describe 'CollectionSpace' do

  test_run = TestConfig.new
  test_data = test_run.create_special_character_test_data
  
  include Logging
  include WebDriverManager

  test_run = TestConfig.new
  
  before(:all) do
    test_run = TestConfig.new
    test_run.set_driver launch_browser
    @admin = test_run.get_admin_user
    @login_page = test_run.get_page CoreLoginPage
    @search_page = test_run.get_page CoreSearchPage
    @login_page.load_page
    @create_new_page = test_run.get_page CoreCreateNewPage
    @login_page.log_in(@admin.username, @admin.password)
    @object_page = test_run.get_page CoreObjectPage
  end

  after(:all) { quit_browser test_run.driver }

  it('Creates a new page and goes to the create a new collection object record') {
      @search_page.click_create_new_link
      @create_new_page.click_create_new_link
      @create_new_page.click_create_new_object
    }

  test_data.each do |test|
    it('Fills in object record with unique ID and the different variations in test 1') {
      @object_page.create_new_object test
      @object_page.click_delete
      }
    end
  end 








  # First get to the actual object record
  # Next input the unique test id (can just make random string since I'm gonna delete anyway)
    # Make sure to save the actual test id somewhere so you can access it later
  # Click the class="cspace-input-MiniButton--normal cspace-input-MiniButton--common cspace-input-Input--common" button 11 times
  # Input the different variations in each of the fields (single lines are in the titles and multilines are in "brief description")
  # Click the save button
  # Search for the record using the test id we saved
  # Make sure all the inputs are still there
  # Delete the record afterwards