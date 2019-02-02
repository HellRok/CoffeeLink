class Api::TeamsController < ApiController
  def url
    @team = Team.find_by(slack_id: params['team_id'])

    helpers.post(params['response_url'], {
      text: "You can access your web portal at #{team_url(@team.obfuscated_id)}"
    })
  end
end
