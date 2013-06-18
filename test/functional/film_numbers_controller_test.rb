require 'test_helper'

class FilmNumbersControllerTest < ActionController::TestCase
  setup do
    @film_number = film_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:film_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create film_number" do
    assert_difference('FilmNumber.count') do
      post :create, film_number: { bom_id: @film_number.bom_id, bom_size: @film_number.bom_size, color_code: @film_number.color_code, color_name: @film_number.color_name, film_date: @film_number.film_date }
    end

    assert_redirected_to film_number_path(assigns(:film_number))
  end

  test "should show film_number" do
    get :show, id: @film_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @film_number
    assert_response :success
  end

  test "should update film_number" do
    put :update, id: @film_number, film_number: { bom_id: @film_number.bom_id, bom_size: @film_number.bom_size, color_code: @film_number.color_code, color_name: @film_number.color_name, film_date: @film_number.film_date }
    assert_redirected_to film_number_path(assigns(:film_number))
  end

  test "should destroy film_number" do
    assert_difference('FilmNumber.count', -1) do
      delete :destroy, id: @film_number
    end

    assert_redirected_to film_numbers_path
  end
end
