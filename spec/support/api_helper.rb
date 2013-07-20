module ApiHelper
  include Rack::Test::Methods

  def app
    Rails.application
  end

  RSpec.configure do |c|
    c.include self,
      :type => :api,
      :example_group => { :file_path => %r(spec/api) }
  end
end

