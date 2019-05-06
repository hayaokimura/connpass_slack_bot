# slack_api.rb

require 'http'
require 'json'
require './connpass_api'

events = ConnpassAPI.search(ARGV[0], ARGV[1])

titles = (events.map { |event| "#{event["title"]}\n#{event["catch"]}\n#{event["event_url"]}\n#{event["started_at"]}\n"}).join("\n")

response = HTTP.post("https://slack.com/api/chat.postMessage", params: {
  token: ENV['SLACK_API_TOKEN'],
  channel: '#connpass',
  text: titles,
})
puts JSON.pretty_generate(JSON.parse(response.body))