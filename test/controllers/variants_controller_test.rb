require 'test_helper'

class VariantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @variant = variants(:one)
  end

  test "should get index" do
    get variants_url
    assert_response :success
  end

  test "should get new" do
    get new_variant_url
    assert_response :success
  end

  test "should create variant" do
    assert_difference('Variant.count') do
      post variants_url, params: { variant: { final_price: @variant.final_price, price: @variant.price, product_id: @variant.product_id, visible: @variant.visible } }
    end

    assert_redirected_to variant_url(Variant.last)
  end

  test "should show variant" do
    get variant_url(@variant)
    assert_response :success
  end

  test "should get edit" do
    get edit_variant_url(@variant)
    assert_response :success
  end

  test "should update variant" do
    patch variant_url(@variant), params: { variant: { final_price: @variant.final_price, price: @variant.price, product_id: @variant.product_id, visible: @variant.visible } }
    assert_redirected_to variant_url(@variant)
  end

  test "should destroy variant" do
    assert_difference('Variant.count', -1) do
      delete variant_url(@variant)
    end

    assert_redirected_to variants_url
  end
end
