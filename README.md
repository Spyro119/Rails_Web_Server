# README
To run the server, you'll need to get API keys for each of these API and store them in an hidden file created using the figaro gem. 
Be sure to run Ruby 2.6.3 -- IBM Watson doesn't support the latest Ruby version.
To get this file (config/application.yml), just run these command in your terminal :"
 $ bundle install
 $ bundle exec figaro install " ). 
 
Add your token/keys in config/application.yml as follow :

  SLACK_WEBHOOK_URL: "your_slack_webhook_URL"
  SLACK_WEBHOOK_CHANNEL: "your_slack_channel"
  SLACK_API_TOKEN: 'your_slack_api_token'
  IBM_WATSON_API_KEY: "your_IBM_Watson_API_key"
  IBM_WATSON_URL: "your_IBM_watson_url"
  TWILIO_ACCOUNT_SID: "your_twilio_account_sid"
  TWILIO_AUTH_TOKEN:  "your_twilio_token"
  twilio_phone_number: "your_twilio_phone"
  Zendesk_Token: 'your_zendesk_token'
  rocket_elevators_api: 'your_slack_channel_token'
  Zendesk_password: "your_password"
  Zendesk_email: "your_email"
  Zendesk_workspace: "your_subdomain/zendesk.com/api/v2"
  SENDGRID_API_KEY: 'your_Sendgrid_API_Key'

We use the following APIs :
 - Twilio
 - Slack
 - Sendgrid
 - Zendesk
 - IBM Watson
 - Google maps API

Unfortunately, we couldn't complete dropbox API.

  Twilio sends an e-mail whenever an elevator needs attention from one of our technician to alert him of the issue so he can troubleshoot and resolve the problem as soon as possible.

   Slack bot sends an alert in a Slack Channel and keep record of every elevator's status changes.

  Sendgrid sends a thank you email whenever a user sends a Lead (Contact us form).

  Zendesk simply sends a notification in " https://team2support.zendesk.com/ " for our team to answer as soon as possible to customers whenever they complete the quote form or the contact us form.

  IBM watson tells the admin information about the database (How many quotes there are, how many elevators per buildings per customers, 
how many elevators are not in service, how many contact requests and how many batteries are deployed across how many cities).

  Google API -- TO ACCESS : https.rocketelevatorsjb.com/buildinglocalisation/building
  Google API allows geolocalisation of customer's buildings and gives every information about it such as the number of floors,  client name, technician name, Adress, number of battery, number of columns and number of elevators.



Unfortunately, many things on this website could be improved, but we didn't have enough time to fix everything.
