require 'test_helper'

class SchoolInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_info = school_infos(:one)
  end

  test "should get index" do
    get school_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_school_info_url
    assert_response :success
  end

  test "should create school_info" do
    assert_difference('SchoolInfo.count') do
      post school_infos_url, params: { school_info: { alias: @school_info.alias, city: @school_info.city, code: @school_info.code, email: @school_info.email, location: @school_info.location, logo: @school_info.logo, name: @school_info.name, phone: @school_info.phone, postal_code: @school_info.postal_code, region: @school_info.region, slogan: @school_info.slogan } }
    end

    assert_redirected_to school_info_url(SchoolInfo.last)
  end

  test "should show school_info" do
    get school_info_url(@school_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_info_url(@school_info)
    assert_response :success
  end

  test "should update school_info" do
    patch school_info_url(@school_info), params: { school_info: { alias: @school_info.alias, city: @school_info.city, code: @school_info.code, email: @school_info.email, location: @school_info.location, logo: @school_info.logo, name: @school_info.name, phone: @school_info.phone, postal_code: @school_info.postal_code, region: @school_info.region, slogan: @school_info.slogan } }
    assert_redirected_to school_info_url(@school_info)
  end

  test "should destroy school_info" do
    assert_difference('SchoolInfo.count', -1) do
      delete school_info_url(@school_info)
    end

    assert_redirected_to school_infos_url
  end
end
