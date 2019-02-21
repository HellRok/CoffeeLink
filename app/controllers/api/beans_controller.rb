class Api::BeansController < ApiController
  def purchase
    @user = User.find_by(slack_id: params['user_id'])

    weight, price = params['text'].split

    name_and_location = params['text'].delete(weight).delete(price).strip

    name, location = name_and_location.downcase.split('from').map(&:titleize)

    weight = Integer(weight.gsub('g', ''))
    price = Monetize.parse(price).cents

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
