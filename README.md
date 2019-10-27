# Text Service Project

See it running in production at: https://obscure-brook-05265.herokuapp.com/

## For Local Development

1. `git clone git@github.com:sponee/text-service-project.git`
2. `cd text-service-project`
3. `bundle install`
4. `bundle exec rake db:setup`
5. `rails s`

## Making Calls in Development
<details>
<summary>In Development you will need to make an outbound call and simulate an inbound response.</summary>

### Make an outbound call
```
curl -X POST -H "Content-Type: application/json" -d '{"to_number": "111222333", "message": "this is my message"}' "http://localhost:3000/outbound"
```
A successful call responds with a 200 status and a message of, "Your message is being processed". Visit http://localhost:3000 in your browser to retrieve the message_id and simulate an inbound response.

 ### Simulate an inbound response
```
curl -X POST -H "Content-Type: application/json" -d '{"message_id": "", "status": "delivered"}' "http://localhost:3000/inbound"
```

A successful inbound call responds with a 200 status and no message. If the status is `invalid` a BadPhoneNumber will be created. Subsequent attempts to deliver messages to known BadPhoneNumbers result in a message that says, "Cannot text a known bad phone number".
</details>

## Making Calls in Production
<details>
<summary>In Production you will only need to make an outbound call.</summary>  

### Make an outbound call
```
curl -X POST -H "Content-Type: application/json" -d '{"to_number": "3233526673", "message": "Autobots, roll out."}' "https://obscure-brook-05265.herokuapp.com/outbound" 
```
</details>

## Administering Text Messages and Bad Phone Numbers
In Development visit localhost:3000
<br/>
In Production visit https://obscure-brook-05265.herokuapp.com/

