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

    helpers.say("Everyone make sure to thank <@#{@user.slack_id}> for grabbing #{weight} grams of #{@bean.name} :coffee:")

    helpers.respond(params['response_url'], {
      text: "Thanks for grabbing #{@bean.name}! I'm sure it'll be delicious."
    })
  end

  def low
    team = User.find_by(slack_id: params['user_id']).team
    next_user = team.users.purchase_order.active.first

    helpers.say("The beans are running low! <@#{next_user.slack_id}> it's your turn to buy :coffee:")
  end
end
