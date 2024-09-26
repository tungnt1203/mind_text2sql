class DashboardController < ApplicationController
  def index
    @datasources = Datasource.all
  end
end
