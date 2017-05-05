# Introduction

Gif Messenger is a simple Sinatra application that allows users to input a search term
and a phone number.  The application will then use the `Giphy` API to obtain the url of
of an gif file that is relevant to the search terms.  It will then send a down-sampled
version of the image to the phone number via `Twilio` that the user provided in the search term.

The Gif Messenger is merely intended to be a small example of my code, and it has not
implemented the features that would make it a suitable production app.  In particular,
it lacks user authentication, a queueing system, and data persistence.

# Running the App

Navigate to the app's directory and then run the following.

```
bundle install
rackup
```

In your browser, visit `localhost:9292` to see the app in action.  Note that the app is
not yet stylized.

# Features to Add

### User Authentication

User authentication would be important to application so that we could provide terms of
service, track how users actually use the app, and persist the data that we need to
contact users later on to let them know when their texts are successful and when they
their text messages fail.

I would use OmniAuth or Devise to implement user authentication.

### Queuing System

The application is already not very responsive because the controller needs to send a
request to Twilio and receive a response.  Moreover, the application has no good way of
dealing with the results of the Twilio request.  The application should have some way
to wait for Twilio to either succeed or fail in sending the text message, but it would be
inappropriate to wait for this information in a controller because that would make the
controller less responsive.

The best way to do this would be to use a background job system like DelayedJob or
Sidekiq to process jobs.  The job should be initialized by the query string and phone
number.  The job should make a request to Twilio and periodically request an update
from Twilio on whether or not the job failed.  The app should then send an email or
text to the user to notify him or her regarding the success and/or failure of the
Twilio request.

### Data Persistence

In addition to user data, the application should probably persist some data regarding
actual search results.  The application could easily persist the gif url that it obtains
from a given query.  It could then persist this url in a database, cache, or both. This
way, the application could simply skip the query if it received the same query string
multiple times.  For example, the app would be able to perform one query when a user
inputs `funny cat` for the search.  Rather than re-running the query, the app could
simply reuse the url for that particular query if another user also searched for
`funny cat`.  Some images are likely to be far more popular than others, so persisting
some search results might improve performance.  We might want to also create a job to
periodically update the url that we are saving for popular searches from time to time.
