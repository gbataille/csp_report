require 'colorize'

module CspReport
  class MigrationGenerator < Rails::Generators::Base

    desc "Retrieves the migration files from the gem"
    def setup_migration
      rake "csp_report:install:migrations"

      puts "\nIf anything was copied".red
      puts "    Don't forget to run 'rake db:migrate'\n".red
    end
  end
end

