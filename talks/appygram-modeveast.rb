# encoding: utf-8

center <<-EOS
  \e[1mOpening next-level dialogue with native app users via Appygram\e[0m


  Rob Heittman
  @rfc2616

  MoDevEast 2013
EOS

block <<-EOS
  Your native app user experienced a problem.

  What should they do?

  A) Suffer
  B) Post a nasty review on the App Store
  C) Engage with someone who can help them
EOS

block <<-EOS
  What kind of response does your user want?

  A) An instant, polite, useless autoresponder
  B) A detailed inquisition about their experience
  C) Actual help from someone who understands
EOS

center <<-EOS
  \e[1mThis shouldn't be hard\e[0m
EOS

center <<-EOS
  \e[1mWhy is this so hard?\e[0m
EOS

block <<-EOS
     many possible responders

  Inhouse            Outsourced
  -------            ----------

  - Helpdesk         - Developers
  - Operations       - Cloud/MBAAS
  - IT               - API Providers
  - Marketing        - Consultants
EOS

block <<-EOS
         using many systems

  - GitHub Issues         - ZenDesk
  - Desk.com              - Assembla
  - Email                 - Basecamp
EOS

center <<-EOS
  \e[1mAnd the rules keep changing...\e[0m


EOS

center <<-EOS
  And the rules keep changing...

  \e[1mand getting more complex...\e[0m
EOS

block <<-EOS
  We got tired of making ad-hoc solutions
  for this problem over and over again.
EOS

block <<-EOS
  So we made this.
EOS

image 'appy-screen1.png'

center <<-EOS
  Appygram provides a smart back end for
  feedback features you build into your
  native mobile app.

  It stores a rolling buffer of recent
  messages, and forwards messages on to
  the services you specify.
EOS

center <<-EOS
  That looks a little bit like this
EOS

image 'appy-example-app.png'

image 'appy-list.png'

image 'appy-sample-email.png'

image 'appy-webhook-config.png'

center <<-EOS
  Using a simple "topic" mechanism,
  you can have different routings.
EOS

image 'appy-topics.png'

center <<-EOS
  You can capture platform info and
  any application-supplied JSON you like

  (so you don't have to follow up
  and ask for that info)
EOS

center <<-EOS
  All the email and webhook config
  lives outside your app in a web
  interface, where you can delegate
  management of it.
EOS

center <<-EOS
  ** ADVANCED **

  Appygram also collects and forwards
  App Store and Google Play reviews

  (contact us to sign up for beta)
EOS

center <<-EOS
  *** SUPER ADVANCED ***

  Appygram can create and route alerts
  about unusual or exceptional conditions
  detected by automated systems.
EOS

block <<-EOS
  Like ...

  - huh, we're getting a lot of exceptions
  - something expected stopped happening
EOS

block <<-EOS
  SPOILERS!

  Where it really gets interesting is
  when we can correlate the two. Users are
  writing in with problems AND some
  monitored conditions are outside of
  normal parameters.
EOS

center <<-EOS
  Appygram is free for personal accounts.

  Just go to \e[1mwww.appygram.com\e[0m to sign up.

  The "freegan" plan will get you going.
EOS

block <<-EOS
  What you don't get as a freegan:

  - Lots and lots of distinct apps
  - Ability to email third parties
  - Ability to delegate access to your apps
    to "watchers"
EOS

block <<-EOS
  What everybody gets on any plan:

  - High availability SSL backend
    compatible with all major mobile devices
  - Fully configurable webhook and email
    forwarders
EOS

block <<-EOS
  Where we are in our journey:

  > 2 million installs talk to Appygram
  > 1 million events processed per week
  > 50,000 actionable messages routed
EOS

center <<-EOS
  Our goal is to do \e[1ma really good job\e[0m

  at something most devs consider \e[1man afterthought.\e[0m
EOS

block <<-EOS
  Infrastructure vendors that make Appygram good:

  SendGrid (mail delivery)
  Google (scalable API endpoints)
  Digital Ocean (website interfaces and workers)
EOS

block <<-EOS
  How do you Appygram?


EOS

block <<-EOS
  How do you Appygram?

  Can you submit a HTML form?
  You're all set.
EOS

block <<-EOS
  How do you Appygram?

  Can you POST or PUT a JSON object?
  You're all set.
EOS

center <<-EOS
  https://www.appygram.com/docs
EOS

image 'appy-docs-screen.png'

center <<-EOS
The only required field is

\e[1mapi_key\e[0m

A valid Appygram API key for your application
EOS

block <<-EOS
All other fields are optional

  \e[1mname\e[0m           Submitter's name
  \e[1memail\e[0m          Submitter's contact email
  \e[1mphone\e[0m          Submitter's telephone number
  \e[1mmessage\e[0m        Body of the message
  \e[1mplatform\e[0m       Platform of the submitter's system
  \e[1msoftware\e[0m       Software version
EOS


code <<-EOS, :java
  // Java/Android

  // Using https://github.com/rfc2616/appygram-android-example
  // http://www.appygram.com/news/android--appygram-101-part-1

  Map<String, String> params = new HashMap<String, String>();
  params.put("name", getUIString(R.id.editName));
  params.put("email", getUIString(R.id.editEmail));
  params.put("message", getUIString(R.id.editMessage));
  new SendAppygramTask(params).execute();
EOS

code <<-EOS, :objectivec
  // iOS
  // Using AFNetworking - https://github.com/AFNetworking/AFNetworking

  AFHTTPRequestOperationManager *manager =
      [AFHTTPRequestOperationManager manager];
  NSDictionary *params = @{@"name": self.usernameField.text,
                           @"email": self.emailField.text,
                           @"message": self.message.text,
                           @"api_key": myApiKey};
  [manager POST:@"https://arecibo.appygram.com/appygrams"
      parameters:params success:^(AFHTTPRequestOperation *operation,
                                 id responseObject) {
      // success
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
      // not success
  }];
EOS

code <<-EOS, :ruby
  # RubyMotion
  # AFMotion - https://github.com/usepropeller/afmotion

  params = {
    :name => @username.text,
    :email => @email.text,
    :message => @message.text,
    :api_key => Constants.api_key
  }
  AFMotion::HTTP.post("http://arecibo.appygram.com/appygrams",
      params) do |result|
    # success
  end
EOS

code <<-EOS, :javascript
  // JavaScript
  // (Ti) https://github.com/dubsoft/appygram-ti
  // (Node) https://github.com/wlaurance/appygram-node

  var appygram = require('appygram');
  appygram.setApiKey('api_key');
  appygram.sendFeedback({
    name:'Will',
    topic:'Feedback',
    message:'I am sending an appygram!',
    email:'w.laurance@gmail.com'
  }, function(){
    //done sending feedback
  });
EOS

code <<-EOS, :ruby
  # Ruby
  # https://github.com/anythinglabs/appygram.rb

  require 'appygram'
  Appygram.send :topic => 'Test', :message => 'This is a test.'
EOS

center <<-EOS
  The Field That Is Not A Field

  \e[1mapp_json\e[0m
EOS

code <<-EOS, :javascript
  {
    "products": [{
      "name":"Bacon Cheeseburger",
      "totalcost":7.49
    }],
    "subtotal":7.49,
    "total":8.32,
    "store_number":5001
  }

EOS

block <<-EOS
  Appygram 2014

  - \e[1mYour #1 Must Have Feature Here\e[0m
  - App store monitoring exits beta
  - More web-based form support
  - Integrate with more crash analytics
  - Rule definitions in web interface
EOS

center <<-EOS
  Source for this talk

  \e[1mhttps://github.com/rfc2616/modev-east-2013\e[0m
EOS

