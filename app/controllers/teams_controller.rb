class TeamsController < ApplicationController
  def show
    @team = Team.find_obfuscated(params['id'])
    @purchases = @team.purchases.includes(:bean).bought_order
    @purchase_order = @team.users.purchase_order
  end
end
