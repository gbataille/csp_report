Install
=======

This files describes all the installation details that the generators are executing
in the back. For an easy installation, consult the [README](./README.md) and just launch the
install generator.  
For more customized details you can find here the under the hood details.

Installation steps
------------------

Each installation step is covered by a generator. Here are their description:


<h3>csp_report:initializer_install</h3>
Pulls in the csp_report initializer that defines the mount point name

<h3>csp_report:mount</h3>
Mounts the engine in the route file

<h3>csp_report:highcharts_include</h3>
Modifies the application.js file to require the csp_report gem main js file

<h3>csp_report:migration</h3>
Pulls in the database migration files from the gem

<h3>csp_report:csp_declaration</h3>
Adds a CSP default policy to the application_controller

