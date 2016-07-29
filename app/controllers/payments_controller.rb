class PaymentsController < ApplicationController

  def create
    begin
      customer_id = Stripe::Customer.create(email:  params[:stripeEmail], source: params[:stripeToken]).id
      charge = Stripe::Charge.create(
        customer:     customer_id,
        amount:       (current_user.cart.total_price*100).to_i,
        description:  "Order user##{current_user.id} Payment",
        currency:     'USD'
      )

      cur_order = current_user.orders.create(cost: current_user.cart.total_price, order_date: Time.new)
      current_user.payments.create(transaction_id: charge.id, amount: current_user.cart.total_price, order_id: cur_order.id )

      current_user.cart.cart_variants.each do |cart_variant|
        product = cart_variant.variant.product
        cur_order.order_items.create!(name: product.name, quantity: cart_variant.quantity,
         price: product.price, variant_id: cart_variant.variant.id )
      end

      current_user.cart.cart_variants.destroy_all

      alert(:success, 'Order Created Successfully')
      redirect_to cur_order

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to :back
    end
  end

end
