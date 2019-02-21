module ApplicationHelper
  def say(text)
    HTTParty.post(ENV['WEBHOOK_URL'],
                  body: { text: text }.to_json,
                  headers: { 'Content-Type': 'application/json' })
  end

  def respond(url, data)
    HTTParty.post(url,
                  body: data.to_json,
                  headers: { 'Content-Type': 'application/json' })
  end
end
