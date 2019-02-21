class Api::UsersController < ApiController
  def create
    @team = Team.create_with(domain: params['team_domain']).
      find_or_create_by(slack_id: params['team_id'])
    @channel = Channel.create_with(name: params['channel_name'], team: @team).
      find_or_create_by(slack_id: params['channel_id'])
    @user = User.create_with(name: params['user_name'], team: @team).
      find_or_create_by(slack_id: params['user_id'])

    helpers.say("<@#{@user.slack_id}> has just joined CoffeeLink, they truly are a great person :coffee:")

    helpers.respond(params['response_url'], {
      text: "You've now been registered to CoffeeLink!"
    })
  end

  def destroy
    @user = User.find_by(slack_id: params['user_id']).destroy!

    helpers.respond(params['response_url'], {
      text: "Goodbye from CoffeeLink, I hope your coffee free existance is worth it..."
    })
  end
end
