CspReport
=========

This gem provides a Rails engine that manages the CSP violations reported by
the client browser (when supported).

Features
========

* Provides a csp_report resource that stores the reported violations.

Install
=======

1. In your *Gemfile*, add the following
```ruby
	gem csp_report
```

2. In your *config/routes.rb*, you need to import the csp routes, like so
```ruby
	mount CspReport::Engine, as: 'csp'
```

where the *as* parameter acts as a url encapsulation for the gem routes. For
example, with the above lines, you would create a */csp/csp_reports* set of
routes in your application
3. You need to configure a CSP on your server response, with the *report_uri*
parameters pointing to the configured REST resource above. Following the setup
above, one solution is to find this in your application_controller.rb file:
```ruby
	class ApplicationController
		before_filter :csp
	
		def csp
			response.headers['Content-Security-Policy'] = "script 'self'; report_uri /csp/csp_reports"
		end
	end
```

To come
=======

* Generators to ease the manual install process
* Generators to help create the proper policies

License
=======

This project is under a MIT-LICENSE.

Author
======
Gregory Bataille
