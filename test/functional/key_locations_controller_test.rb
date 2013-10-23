require 'test_helper'

class KeyLocationsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => KeyLocation.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    KeyLocation.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    KeyLocation.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to key_location_url(assigns(:key_location))
  end

  def test_edit
    get :edit, :id => KeyLocation.first
    assert_template 'edit'
  end

  def test_update_invalid
    KeyLocation.any_instance.stubs(:valid?).returns(false)
    put :update, :id => KeyLocation.first
    assert_template 'edit'
  end

  def test_update_valid
    KeyLocation.any_instance.stubs(:valid?).returns(true)
    put :update, :id => KeyLocation.first
    assert_redirected_to key_location_url(assigns(:key_location))
  end

  def test_destroy
    key_location = KeyLocation.first
    delete :destroy, :id => key_location
    assert_redirected_to key_locations_url
    assert !KeyLocation.exists?(key_location.id)
  end
end
