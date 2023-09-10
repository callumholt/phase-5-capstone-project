require 'net/http'
require 'json'

# Define the API endpoint and parameters
url = URI('https://api.openai.com/v1/chat/completions')
# api_key = ENV['OPEN_AI_KEY']
api_key = "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";


puts "API Key: #{api_key}"


headers = {
  'Content-Type' => 'application/json',
  'Authorization' => "Bearer #{api_key}"
}

# Define the message parameters
messages = [
  { role: 'system', content: 'You are a helpful assistant.' },
  { role: 'user', content: 'can you make me a list of 3 country names' }
]


# Create the request
request = Net::HTTP::Post.new(url)
request.body = {
  model: 'gpt-3.5-turbo',
  messages: messages
}.to_json
request.initialize_http_header(headers)

# Send the request
response = Net::HTTP.start(url.host, url.port, use_ssl: true) do |http|
  http.request(request)
end

# Print the response
puts response.body
