Rails.configuration.stripe = {
  publishable_key: 'pk_test_Y8ZjK3gCLFuCm93Q41VP0TcT',
  secret_key:      'sk_test_8iBBOPMikXIvcE2HZ7Lk1pW3'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]