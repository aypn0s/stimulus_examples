class ProductsReflex < ApplicationReflex
  def add_variant
    product_params = params.require(:product).permit!
    product_id = element.dataset.product_id
    @product = product_id.present? ? Product.find(product_id) : Product.new
    @product.assign_attributes(product_params)
    @product.variants.build
  end

  def update
    product_params = params.require(:product).permit!
    product_id = element.dataset.product_id
    if product_id.present?
      @product = Product.find(element.dataset.product_id)
      @product.update(product_params)
    else
      @product = Product.new
      product_params[:variants_attributes].each do |variant|
        vat = product_params[:vat].to_i
        price = variant[:price].to_i
        variant[:final_price] = vat > 0 ? price + ((price * vat) / 100) : price
      end
      @product.assign_attributes(product_params)
    end
  end
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com
end
