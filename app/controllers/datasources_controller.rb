class DatasourcesController < ApplicationController
  before_action :find_datasource, only: [ :edit, :update, :destroy ]

  def index
    @datasources = Datasource.all
  end

  def new
    @datasource = Datasource.new
  end

  def create
    @datasource = Datasource.new(datasource_params)

    respond_to do |format|
      if @datasource.test_connection && @datasource.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend("datasources", partial: "datasources/datasource", locals: { datasource: @datasource }),
            turbo_stream.update("modal", ""),
            turbo_stream.update("flash", partial: "shared/flash", locals: { flash: { notice: "Datasource was successfully created." } })
          ]
        end
        format.html { redirect_to @datasource, notice: "Datasource was successfully created." }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("modal", template: "datasources/new", locals: { datasource: @datasource }),
            turbo_stream.replace("flash", partial: "shared/flash", locals: { message: "Error creating datasource.", type: "alert" })
          ]
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @datasource.assign_attributes(datasource_params)

    respond_to do |format|
      if @datasource.valid?
        if @datasource.test_connection && @datasource.save
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.replace("datasource_#{@datasource.id}", partial: "datasources/datasource", locals: { datasource: @datasource }),
              turbo_stream.update("modal", ""),
              turbo_stream.update("flash", partial: "shared/flash", locals: { flash: { notice: "Datasource was successfully updated." } })
            ]
          end
          format.html { redirect_to @datasource, notice: "Datasource was successfully updated." }
        else
          error_message = "Failed to update datasource. Please check your connection details."
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.replace("modal", template: "datasources/edit", locals: { datasource: @datasource }),
              turbo_stream.replace("flash", partial: "shared/flash", locals: { message: error_message, type: "alert" })
            ]
          end
          format.html { render :edit, status: :unprocessable_entity }
        end
      else
        error_message = @datasource.errors.full_messages.join(", ")
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("modal", template: "datasources/edit", locals: { datasource: @datasource }),
            turbo_stream.replace("flash", partial: "shared/flash", locals: { message: error_message, type: "alert" })
          ]
        end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @datasource.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove("datasource_#{@datasource.id}"),
          turbo_stream.update("flash", partial: "shared/flash", locals: { flash: { notice: "Datasource was successfully deleted." } })
        ]
      end
      format.html { redirect_to datasources_url, notice: "Datasource was successfully deleted." }
    end
  end

  private

  def find_datasource
    @datasource = Datasource.find(params[:id])
  end

  def datasource_params
    params.require(:datasource).permit(:description, :type_source, :host, :user, :password, :port, :database)
  end
end
