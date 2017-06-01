require 'test_helper'

class GradelevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gradelevel = gradelevels(:one)
  end

  test "should get index" do
    get gradelevels_url
    assert_response :success
  end

  test "should get new" do
    get new_gradelevel_url
    assert_response :success
  end

  test "should create gradelevel" do
    assert_difference('Gradelevel.count') do
      post gradelevels_url, params: { gradelevel: { level: @gradelevel.level, name: @gradelevel.name } }
    end

    assert_redirected_to gradelevel_url(Gradelevel.last)
  end

  test "should show gradelevel" do
    get gradelevel_url(@gradelevel)
    assert_response :success
  end

  test "should get edit" do
    get edit_gradelevel_url(@gradelevel)
    assert_response :success
  end

  test "should update gradelevel" do
    patch gradelevel_url(@gradelevel), params: { gradelevel: { level: @gradelevel.level, name: @gradelevel.name } }
    assert_redirected_to gradelevel_url(@gradelevel)
  end

  test "should destroy gradelevel" do
    assert_difference('Gradelevel.count', -1) do
      delete gradelevel_url(@gradelevel)
    end

    assert_redirected_to gradelevels_url
  end
end
