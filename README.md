# README
TDD: 

The TDD method code can be found in the spec folder. The code for the ElevatorMedia::Streamer can be found lib folder.
My getContent method is the method that fetch html from a webpage to render it. Unfortunately, the method using Net::HTTP gem fetches the entire web body, so a "cut" string method is needed. 

La commande :  bundle exec rspec --format doc 
My TDD assures that the Net::HTTP method in ElevatorMedia::Streamer.getContent makes the connection with the webage and that it fetches the info and store it in "@abody" variable as an html String. 

My TDD for my models user and Employees mostly validates my params, while my Sendgrid TDD validates the API call connection and the results. 
==================================================================================================================================
Week 8 fixes done :

vast majority of fields has been protected from SQL Injection by setting a whitelist to prevent special characters in fields where it is not required and using Application Record sanitization over forms parameters before submit. 

To prevent cross-site scripting, the whitelist do most of the job as special characters are not allowed unless needed but where special characters are needed, rails embeds special characters so "html" doesn't interprete it as code to run.
To prevent CSRF, rails also has a pre-made function to call in forms controllers : "Protect_from_forgery".  

Log-ins have been secured by using a whitelist already made by Devise (The little line of code "validate: email before submit for instance) and a little password configuration requirements, making it safer for users when creating an account.
Passwords now requires at least one capital letters, 1 number and 8 characters minimum.

Pictures are now finally fixed, github used to interprete jpeg as CRLF instead of as binary, resulting in picture distortion. 

Devise had a feature to also hashes password and script them, which is enabled, making it safer for users.

The employee sign up page is now unnaccessible by anyone and can only sign up an employee from the admin section of the website (So only another employee can create an employee account -- and eventually, with a temporarily password that the employee will change when first logging in when I'll finish coding this). 

==================================================================================
To access interventions ticket creation page, you'll first need to log in as an employee in the login/sign up tab of the header.
Once signed in, a new tab with a welcome message will appear in the headerr, the intervention ticket creation is right there. If a user happened to find the create ticket page, he will be redirect to the employee sign up -- so unless registered as an employee, there's no way somebody else can access this page. 

To complete the form, you absolutely need to complete at least those 3 fields : Customer's name, customer's building and the description field. 
Once Customer's name field is complete, building's field will appear with new values (Customer's building(s)), and every time you complete the building field/battery field/column field, the next field will reappear with new option values depending on the previous fields values. 

Uncompleted fields will return "null" to the database table Interventions, as they're allowed to be null and can be either completed later -- if an employee is assigned, for example -- or just leave them null.

Once submit, this will created a Zendesk ticket to rocketelevators6984.zendesk.com with those infos (The message adapts depending on the fields completed) with the ticket type being "problem" and requester being the current employee submitting the form (or author of the ticket). 
To log onto Zendesk API => 
Username : samuelJubinville119@gmail.com
password : rocketelevators

An intervention tab will contain every intervention Ticket (they are filtered on the ticket type "problem" ).


===================================================================================================================================
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

  Zendesk simply sends a notification in " https://rocketelevators6984support.zendesk.com/ " for our team to answer as soon as possible to customers whenever they complete the quote form or the contact us form.

  IBM watson tells the admin information about the database (How many quotes there are, how many elevators per buildings per customers, 
how many elevators are not in service, how many contact requests and how many batteries are deployed across how many cities).

  Google API -- TO ACCESS : https.rocketelevatorsjb.com/buildinglocalisation/building
  Google API allows geolocalisation of customer's buildings and gives every information about it such as the number of floors,  client name, technician name, Adress, number of battery, number of columns and number of elevators.



Unfortunately, many things on this website could be improved, but we didn't have enough time to fix everything.
