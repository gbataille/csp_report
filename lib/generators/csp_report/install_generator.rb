module CspReport
  class InstallGenerator < Rails::Generators::Base
    desc "Adds route to the csp_report resource"
    def setup_route
      route "mount CspReport::Engine, at: 'csp'"
    end

    desc "Retrieves the migration files from the gem"
    def setup_migration
      rake "csp_report:install:migrations"
      puts "\n    Don't forget to run 'rake db:migrate'\n"
    end
  end
end
