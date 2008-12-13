require File.dirname(__FILE__) + '/../test_helper'

# make sure the secret for request forgery protection is set (views will
# explicitly use the form_authenticity_token method which will fail otherwise)
PostsController.request_forgery_protection_options[:secret] = 'test_secret'

class PostsControllerTest < ActionController::TestCase

  def test_should_get_index
    get :index
    assert_response :success
    get :index, :format => 'ext_json'
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_post
    assert_difference('Post.count') do
      xhr :post, :create, :format => 'ext_json', :post => { }
    end

    assert_not_nil flash[:notice]
    assert_response :success
  end

  def test_should_show_post
    get :show, :id => posts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => posts(:one).id
    assert_response :success
  end

  def test_should_update_post
    xhr :put, :update, :format => 'ext_json', :id => posts(:one).id, :post => { }
    assert_not_nil flash[:notice]
    assert_response :success
  end

  def test_should_destroy_post
    assert_difference('Post.count', -1) do
      xhr :delete, :destroy, :id => posts(:one).id
    end

    assert_response :success
  end
end
