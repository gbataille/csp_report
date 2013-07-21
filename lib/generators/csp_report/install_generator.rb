module CspReport
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)
    argument :namespace, type: :string, default: 'csp'

    desc "Adds an initializer storing the defined namespace"
    def setup_namespace
      template "csp_report_initializer.erb", "config/initializers/csp_report.rb"
    end

    desc "Adds route to the csp_report resource"
    def setup_route
      route "mount CspReport::Engine, at: '#{urlNamespace}'"
    end

    desc "Retrieves the migration files from the gem"
    def setup_migration
      rake "csp_report:install:migrations"
      puts "\n    Don't forget to run 'rake db:migrate'\n"
    end

    private

    def urlNamespace
      namespace.underscore
    end
  end
end
