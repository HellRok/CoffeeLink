class Api::BeansController < ApiController
  def purchase
    @user = User.find_by(slack_id: params['user_id'])

    with_location = /.*"(.*)".*"(.*)"/
    without_location = /.*"(.*)"/

    weight, price = params['text'].split

    weight = Integer(weight.gsub('g', ''))
    price = Monetize.parse(price).cents

    case params['text']
    when with_location
      name = $LAST_MATCH_INFO[1]
      location = $LAST_MATCH_INFO[2]
    when without_location
      name = $LAST_MATCH_INFO[1]
      location = ''
    end

    @bean = Bean.create_with(location: location, team: @user.team).
      find_or_create_by(name: name)

    @purchase = Purchase.create(
      user: @user,
      bean: @bean,
      price_cents: price,
      weight: weight
    )

    helpers.post(params['response_url'], {
      text: "Thanks for grabbing #{@bean.name}! I'm sure it'll be delicious."
    })
  end
end
