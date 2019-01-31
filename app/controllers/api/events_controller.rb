class Api::EventsController < ApiController
  def create
    if params['challenge']
      render plain: params['challenge'], content_type: 'text/plain'
    end
  end
end
