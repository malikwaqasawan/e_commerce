$(function() {
  $('.change-quantity').change(function(){

    $.ajax({
    url: '/update_quantity',
    data: { cart_variant_id: $(this).attr('data-cart-variant-id'),
      cart_variant_quantity: $(this).val() },
    type: 'POST',
    success: function(data) {
      $('#total-amount-' + data['id']).text((data['total_amount']));
      $('#total-price').text((data['total_price']));
      $("html, body").animate({ scrollTop: 0 }, "slow");

      $('#show-notice').text('Qunatity selected').show().delay(2000).fadeOut('slow', function() {
        $(this).hide();
    });
    },
    error: function() {
      $('#show-notice').text("Qunatity not selected").show().delay(2000).fadeOut('slow', function() {
        $(this).hide();
    });
    }
    });
  });

});