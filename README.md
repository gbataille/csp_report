CspReport
=========

This gem provides a Rails engine that manages the CSP violations reported by
the client browser (when supported).

**Disclaimer**

This is a rough cut gem for the moment. It won't look like much in the report
page. However, elements have a class so you can add some CSS style before I
 add some clean ones in the gem.

What is CSP
===========

CSP (Content Security Policy) is a way to limit cross site scripting by relying
on the browser as a last line of defense. It does not mean the other anti XSS
practices are to be forgotten though.

For more information, consult
* [The W3C policy](http://www.w3.org/TR/CSP/)
* [Wikipedia](http://en.wikipedia.org/wiki/Content_Security_Policy)
* [The Google Chrome explanation](https://developer.chrome.com/extensions/contentSecurityPolicy.html)

[Browser supporting CSP](http://caniuse.com/#search=csp)

Tested in Chrome 27 and shown to work with the *'Content-Security-Policy'* new
directive.
Safari 6 already supports it but with the *'X-Webkit-CSP'* directive. However, it
seems the *report_uri* parameter is not yet supported there.

Features
========

* Provides a *csp_report* resource that stores the reported violations.

Install
=======

1. In your *Gemfile*, add the following
```
	gem csp_report
```
Don't forget to run `bundle install` afterwards

1. Run the generator
```shell
	rails generate csp_report:install
```
It retrieve the db migration files from the gem and install them  
It mounts the gem routes in the application  
*Don't forget to run the `rake db:migrate` command*

1. You need to configure a CSP on your server response, with the *report_uri*
parameters pointing to the configured REST resource above. Following the setup
above, one solution is to find this in your application_controller.rb file:
```ruby
	class ApplicationController
		protect_from_forgery

		before_filter :csp
	
		def csp
			response.headers['Content-Security-Policy'] = "script-src 'self'; report-uri /csp/csp_reports"
		end
	end
```

1. You're all set. Accessing *application_root_url*/csp/csp_reports will display
a list of all the CSP violation that were reported.

Trying it out
=============

With the policy set as an example above (*script 'self'*), inline javascript is
not authorized. Just put some

```html
	<script>
		alert('test')
	</script>
```

in one of your HTML rendered file and launch it in a browser. If the setup is
correct and you browser supports CSP, the script will not play (no pop-up) and 
you'll have one more record in the /csp/csp_reports list.

Why using this gem
==================

CSP is yet another layer of protection, basically relying on the browser to do
some level of control. This is a way to prevent some man in the middle attack 
where someone intercepts the server response and try to change it. While not
foolproof, it's a good additional security layer.

This gem comes in handy for 2 reasons:
* First, when activating CSP directives on your existing site, it is likely 
that you'll have a hard
time figuring out all the sources you are using. By recording all the breaches,
 this gem allows you to setup a policy, run a crawler for example, and then 
look at what is reported as breaches. It will help you getting rid of your 
inline js and so on.
* Second, in normal production mode, it'll help you monitor the situation and 
see if your server has been victim of some injection (if some input is not 
sanitize properly) or if your users are being attacked in some way (in which 
case you might gather stats and maybe warn them in one way or another).

To come
=======

* Generators to ease the manual install process
* Generators to help create the proper policies

License
=======

This project is under a MIT-LICENSE.

Author
======

[Gregory Bataille](https://github.com/gbataille)
