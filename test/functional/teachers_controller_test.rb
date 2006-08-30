require File.dirname(__FILE__) + '/../test_helper'
require 'teachers_controller'

# Re-raise errors caught by the controller.
class TeachersController; def rescue_action(e) raise e end; end

class TeachersControllerTest < Test::Unit::TestCase
  fixtures :teachers

  def setup
    @controller = TeachersController.new
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

    assert_not_nil assigns(:teachers)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:teacher)
    assert assigns(:teacher).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:teacher)
  end

  def test_create
    num_teachers = Teacher.count

    post :create, :teacher => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_teachers + 1, Teacher.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:teacher)
    assert assigns(:teacher).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Teacher.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Teacher.find(1)
    }
  end
end
