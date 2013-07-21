module CspReport
  class InitializerInstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)
    argument :namespace, type: :string, default: 'csp'

    desc "Adds an initializer storing the defined namespace"
    def setup_namespace
      template "csp_report_initializer.erb", "config/initializers/csp_report.rb"
    end

    private

    def urlNamespace
      namespace.underscore
    end
  end
end

