class HomeController < ApplicationController
  def index
    @report = CspReport::CspReport.new
  end
end
