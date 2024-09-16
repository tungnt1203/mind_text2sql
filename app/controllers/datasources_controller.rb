class DatasourcesController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def connection
  end

  private

  def postgres_permit_params
    params.require(:datasource)
          .permit(
            :description,
            :type,
            :host,
            :user,
            :password,
            :port,
            :database,
            :schema,
          )
  end
end
