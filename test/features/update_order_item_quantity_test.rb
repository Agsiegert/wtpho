require './test/test_helper'

class UpdateOrderItemQuantityTest < ActionController::TestCase

  setup do
    Capybara.reset_sessions!
  end

  test "it updates the quantity of an item in an order" do
    create_items

    within "#item-1" do
      click_on "Add to Order"
    end

    visit order_path

    within "#items_for_order" do
      assert page.has_content?("1")
      fill_in "quantity", :with => "20"
      click_on "Update "
    end

    # within "#item-2" do
    #   click_on "Add to Order"
    # end

    # visit order_path

    # within("#items_for_order") do
    #   assert page.has_content?("Phonatic")
    #   assert page.has_content?("The best soup in town")
    #   assert page.has_content?("$10.00")
    #   assert page.has_content?("Phonominal")
    #   assert page.has_content?("The better soup in town")
    #   assert page.has_content?("$20.00")
    # end
  end

  def create_items
    visit items_path

    click_on "New Item"

    fill_in "title", :with => "Phonatic"
    fill_in "description", :with => "The best soup in town"
    fill_in "price", :with => 10.00

    click_on "Save Item"

    visit items_path

    click_on "New Item"

    fill_in "title", :with => "Phonominal!"
    fill_in "description", :with => "The better soup in town"
    fill_in "price", :with => 20.00

    click_on "Save Item"
  end

end
