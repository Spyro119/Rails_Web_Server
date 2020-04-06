require 'http'
require 'json'

rc = HTTP.post("https://slack.com/api/chat.postMessage", params: {
    token: ENV['SLACK_API_TOKEN'],
    channel: '#elevator_operations',
    text: 'The Elevator [ID Elevator] with Serial Number [Serial Number] changed status from [Old Status] to [New Status]'
    as_user: true
    })
puts JSON.pretty_generate(JSON.parse(rc.body))
