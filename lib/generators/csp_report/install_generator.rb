require 'colorize'

module CspReport
  class InstallGenerator < Rails::Generators::Base

    argument :namespace, type: :string, default: 'csp'
    class_option :add_declaration, type: :boolean, default: false,
      aliases: "-a",
      description: "Modify the application controller to add a filter for the CSP directive"

    desc "Performs all the tasks for the initial install"
    def install

      puts "Running the install procedure with mount point #{mount_point}"
      puts "\n"

      # If it's not the first run, the generator will ask to overwrite the
      # existing initializer
      generate "csp_report:initializer_install" , "#{namespace}"
      # If it is not the first run but the mount point was not change, nothing
      # happens
      generate "csp_report:mount"               , "#{namespace}"
      # If this is not the first run, only the delta is copied.
      generate "csp_report:migration"

      if options.add_declaration?
        generate "csp_report:csp_declaration"
      end
    end

    private

    # Proxy to get the override text displayed only once
    def mount_point
      @mount_point ||= mount_point_value
    end

    def mount_point_value
      if defined? CspReport::MOUNT_POINT
        puts "\nThe CspReport engine has already been installed.".yellow
        puts "  Overriding the mount point to #{CspReport::MOUNT_POINT}.".yellow
        CspReport::MOUNT_POINT
      else
        namespace
      end
    end
  end
end
