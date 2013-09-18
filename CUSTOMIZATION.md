ENGINE CUSTOMIZATION
====================

Styles / CSS
------------

As for any engine, it might be interesting for you to override the styles that I
have defined as a default, typically to make it look like the rest of your site.
This gem is meant to be used in an admin section, so this might not be a priority.
Still...

Ryan Bates shows how to do this applied to the Spree gem in one of his railscast.
This is certainly the first source to consult.
Basically the 2 main methods are
- Finding where the gem assets are and placing a similarly named file in the same
place in your application. The problem with that is that you fully override the 
gem CSS and have to redefine every single things. Updating to a new version of
the gem that might have additional styles might be a problem too.
- Use the Defacer gem. It is basically used to intercept elements being rendered
and override their style. Practical, precise, but cumbersome to setup and 
maintain.

That is really not something that is practical to me. I haven't looked in an
history or something similar, but I find that the way Sprockets handles the 
engine's assets is not optimal.

+To come:+ depending on the community's reactions and on my testing, I'll try to
bring the CSS down to the application through the install controller so that
user's can import it manually and override it. Not sure if this'll work fine 
as the style are for the engine's views and not some client application views.

+Note:+ I'm far from being an expert on the matter. This is just the state of my
investigation. Feel free to correct me if
necessary.

Changing the CSP rule per controller/action
-------------------------------------------

The Content-Security-Policy main declaration, if you used this gem generator,
is located in the application_controller, in a before_filter. Therefore,
overriding this header property in another controller in a before or after
filter will override the site wide setting. You can use the below snippet:
```ruby
class HomeController < ApplicationController
  before_filter :csp

  def csp
    policy =  "default *;"
    policy << "script-src *;"
    policy << "report-uri /#{CspReport::MOUNT_POINT}/csp_reports"
    response.headers['Content-Security-Policy'] = policy
  end
end
```

This can allow you to tune the policy for each controller and therefore be a
lot more precise in your security setup.
For even more control, this snippet can be used to override the response
header property in a controller action, to even be specific to a single
action/view rather than site wide or controller/resource wide.
[Back to Readme](./README.md)
