require File.dirname(__FILE__) + '/../test_helper'
require 'menu_items_controller'

# Re-raise errors caught by the controller.
class MenuItemsController; def rescue_action(e) raise e end; end

class MenuItemsControllerTest < Test::Unit::TestCase
  fixtures :menu_items

  def setup
    @controller = MenuItemsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:menu_items)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:menu_item)
    assert assigns(:menu_item).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:menu_item)
  end

  def test_create
    num_menu_items = MenuItem.count

    post :create, :menu_item => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_menu_items + 1, MenuItem.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:menu_item)
    assert assigns(:menu_item).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil MenuItem.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      MenuItem.find(1)
    }
  end
end
