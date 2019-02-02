class TeamsController < ApplicationController
  def show
    @team = Team.find_obfuscated(params['id'])
  end
end
