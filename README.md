CspReport
=========

[![Latest Released Gem Version](https://badge.fury.io/rb/csp_report.png)](http://badge.fury.io/rb/csp_report)
[![Build Status](https://travis-ci.org/gbataille/csp-report.png)](https://travis-ci.org/gbataille/csp-report)

This gem provides a Rails engine that manages the CSP violations reported by
the client browser (when supported).

As of today (Sept 14th), a new editor's draft of CSP 1.1 is available and got
rid of the new proposed report elements. Therefore, as of today too, I'll
publish the current version of the gem as the csp_report 1.0 version.

[Installation](#install) | [Upgrade](#upgrade-notes) | 
[Configuration](#trying-it-out) | [Description](#what-is-csp)

**Careful**: If migrating from an earlier version, please look up the upgrage
instructions.

Now that v1.0 is out, I would advise to redo an install from scratch or to 
consult the new [INSTALL](./INSTALL.md) file for details of what should be 
installed

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

Tested in Chrome (since version 27) and shown to work with the *'Content-Security-Policy'* new
directive.
Safari 6 already supports it but with the *'X-Webkit-CSP'* directive. However, it
seems the *report_uri* parameter is not yet supported there.

Features
========

* Provides a *csp_report* resource that stores the reported violations.
* Displays the violation for analysis along with consolidated reports.
* Keeps up-to-date with the CSP W3C RFC

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
inline js and tuning your policy.
* Second, in normal production mode, it'll help you monitor the situation and 
see if your server has been victim of some injection (if some input is not 
sanitize properly) or if your users are being attacked in some way (in which 
case you might gather stats and maybe warn them in one way or another).

Install
=======

_(See the [INSTALL.md](./INSTALL.md) file for more details)_

1. In your *Gemfile*, add the following
```
	gem csp_report
```
Don't forget to run `bundle install` afterwards

1. Run the generator. The engine mount point is configurable. By default it will be 
**/csp** but you can change that to your liking by passing a parameter to the
install generator  
If you want to run the easy install step just after, you can now pass the -a
param to the install generator and it will execute the csp_declaration generator
too
```shell
	rails generate csp_report:install [mount_point_name] [-a]
```
Among other things, it retrieves the db migration files from the gem and copy them in the application  
*Don't forget to run the `rake db:migrate` command*

1. **EASY INSTALL**: if you used the *-a* parameter above, you can skip this
Use the helper generator to get your CSP directive skeleton.
It will use the mount point that you defined in the install.
Execute
```shell
	rails generate csp_report:csp_declaration
```
You can then customize the directive in the ApplicationController.

1. *(If you have not followed the previous step and not used the -a parameter)* 
You need to configure a CSP on your server response, with the *report_uri*
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
a list of all the CSP violation that were reported (*csp* might be replaced by
your custom mount point).

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

Tuning the engine
=================

[Customization](./CUSTOMIZATION.md)

Utilities
=========

* For general usage, a constant CspReport::MOUNT_POINT is defined with the 
namespace provided while running the install generator. This constant is
typically used in the response header construction.
* For "plugability", as for any engine, rails gives some helper objects. While
I could not get it to work as I wanted, in a view you can use *csp_report.routes.url_helpers*
and it will give you access to all the engine URL helpers.

To come
=======

* Customization instructions
* Support of CSP 1.1 draft spec

Upgrade notes
=============

Upgrade from 0.1.x
------------------

CAREFUL, 0.2.0 comes with DB changes. I won't do that in a minor after we are at
v1, but for the moment, I thought it would not trouble too many people.

Make sure to run
```shell
rake csp_report:install:migrations
rake db:migrate
```
before continuing

Upgrade from 0.2.x or below
---------------------------

Version 0.3.0 comes with a configurable mount point and a couple of helpers that
are accessible through the generators.
While not strictly necessary (at least for the moment nothing depends on it),
I would advise to
* Edit your config/routes.rb and remove the mount instruction for the engine
* run the mount generator. You can take this opportunity to configure the mount
point to be something else than the default 'csp' by simply passing a name:
```shell
rails generate csp_report:mount [NAMESPACE]
```
* run the initializer generator
```shell
rails generate csp_report:initializer_install
```

Upgrade from 0.3.x or below
---------------------------

Version 0.4.0 and above introduce a new javascript integration point to add the
highchart library used to produce some visualization of the reporting data.
The install generator would provide the additional hook. Rather than re-running
the entire install (not tested), you can either
* run the `csp_report:highcharts_include` generator
* or add the `//= require csp_report` in your application.js file.

License
=======

This project is under a MIT-LICENSE.

Author
======

[Gregory Bataille](https://github.com/gbataille)
