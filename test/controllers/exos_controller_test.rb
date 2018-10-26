require 'test_helper'

class ExosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exo = exos(:one)
  end

  test "should get index" do
    get exos_url
    assert_response :success
  end

  test "should get new" do
    get new_exo_url
    assert_response :success
  end

  test "should create exo" do
    assert_difference('Exo.count') do
      post exos_url, params: { exo: { comment: @exo.comment, name: @exo.name, points: @exo.points, position: @exo.position } }
    end

    assert_redirected_to exo_url(Exo.last)
  end

  test "should show exo" do
    get exo_url(@exo)
    assert_response :success
  end

  test "should get edit" do
    get edit_exo_url(@exo)
    assert_response :success
  end

  test "should update exo" do
    patch exo_url(@exo), params: { exo: { comment: @exo.comment, name: @exo.name, points: @exo.points, position: @exo.position } }
    assert_redirected_to exo_url(@exo)
  end

  test "should destroy exo" do
    assert_difference('Exo.count', -1) do
      delete exo_url(@exo)
    end

    assert_redirected_to exos_url
  end
end
