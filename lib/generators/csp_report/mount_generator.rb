module CspReport
  class MountGenerator < Rails::Generators::Base
    argument :namespace, type: :string, default: 'csp'

    desc "Adds route to the csp_report resource"
    def setup_route
      route "mount CspReport::Engine, at: '#{urlNamespace}'"
    end

    private

    def urlNamespace
      namespace.underscore
    end
  end
end

