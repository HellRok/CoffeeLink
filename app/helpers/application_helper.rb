module ApplicationHelper
  def post(url, data)
    HTTParty.post(url,
                  body: data.to_json,
                  headers: { 'Content-Type': 'application/json' })
  end
end
