# Mail My Week
## Here's the intention:
A simple app that would log you into Google, grab your Google calendars. You'd select which calendars you want to include, then it emails you once a week on Sunday afternoon (or whenever) to tell you what's going on that week.

### What I've got so far
I worked on this for most of a Saturday, Dec. 17, 2016. I:
- Scaffolded the app and set up databases
- Added Devise user authentication and User model
- Configured oauth login with Google
- Connected with the GCal API - extracing a list of calendars and a list of events for one particular calendar - depending on who is logged into with Google oauth. Displayed that data on a page.

### To Do
- Set up ActionMailer. I might have gotten most of the way (I am seeing the html format and to/from in the logs) but I think ActionMailer won't actually send anything in test/development.
- Set up ActiveJob, so I can queue the emails and send them when the server is ready.
- Those are probably cake. The real problem, as I see it, is somehow getting the server to run the API call and send the email when no one is logging in or making any requests. I figured I'd get it to work if I visited a URL but this needs to happen without a human going to the site - that defeats the entire purpose.
  * Additionally, the token Google uses expires after one hour. The app would need to somehow reactivate that user's token without the user clicking an accept button. This may be the crux of the app and the reason I haven't found anything like it on the internet.
  
  
### Technologies
- Ruby on Rails (ActionMailer and ActiveJob)
- Devise (user authentication)
- Google Calendar API (see Google Developer Console)

### Resources
http://stackoverflow.com/questions/4313177/sending-mail-with-rails-3-in-development-environment
http://www.thegreatcodeadventure.com/using-the-google-api-ruby-client-with-google-calendar-api/
https://github.com/zquestz/omniauth-google-oauth2
http://landonmarder.com/posts/2014/06/04/google-cal-rails/
https://developers.google.com/google-apps/calendar/concepts/#events_resource
http://nithinbekal.com/posts/rails-recurring-events/