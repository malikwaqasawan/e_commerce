class CartsController < ApplicationController

  def index
  end

  def create
    @product = Product.find(params[:product_id])
    variant = @product.variants.first

    cart_variant = current_user.cart.cart_variants.where(variant_id: variant.id).first
    if cart_variant
      if cart_variant.quantity >= 5
        alert(:warning,'Product can be Addded at max 5 times')
        redirect_to products_path
      else
        cart_variant.update(quantity: cart_variant.quantity + 1)
        alert(:success,'Added to the cart Successfully')
        redirect_to products_path
      end
    elsif current_user.cart.cart_variants.create(variant_id: variant.id, quantity: 1)
      alert(:success,'Added to the cart Successfully')
      redirect_to products_path
    else
      alert(:warning,'Not added to the cart Successfully')
      redirect_to products_path
    end

  end

  def update_quantity

    cart_variant = current_user.cart.cart_variants.find(params[:cart_variant_id])
    cart_variant.update(quantity: params[:cart_variant_quantity])

    render json: {
      message: 'success',
      total_amount: (cart_variant.variant.product.price*cart_variant.quantity).to_f.to_s,
      id: cart_variant.id,
      total_price: current_user.cart.total_price.to_f.to_s
    }

  end

  def delete_cart_variant
    @cart_variant = current_user.cart.cart_variants.find(params[:cart_variant_id])
    @cart_variant.destroy
    alert(:success,'Product Deleted Successfully')
    redirect_to carts_path
  end

end
