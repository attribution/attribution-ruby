# attribution-ruby

attribution = Attribution::Client.new(ENV['PROJECT_ID'])
attribution.track( 
  event: "Charge Credit Card",
  user_id: USER_ID,
  properties: {
    revenue: 14.99
  }
)

attribution.alias(
  user_id: USER_ID,
  previous_id: PREVIOUS_ID
)

attribution.identify(
  user_id: USER_ID,
  traits: {
    email: 'test@example.com'
  }
)
