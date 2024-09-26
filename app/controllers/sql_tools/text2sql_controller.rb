class SqlTools::Text2sqlController < ApplicationController
  def index
    @datasources = Datasource.all
  end

  def create
      client = Minds::Api::Client.new

      datasource = Datasource.find(params[:datasource_id])
      system_message = "Given the following SQL tables, your job is to write queries given a user’s request.\n    \n    CREATE TABLE Orders (\n      OrderID int,\n      CustomerID int,\n      OrderDate datetime,\n      OrderTime varchar(8),\n      PRIMARY KEY (OrderID)\n    );\n    \n    CREATE TABLE OrderDetails (\n      OrderDetailID int,\n      OrderID int,\n      ProductID int,\n      Quantity int,\n      PRIMARY KEY (OrderDetailID)\n    );\n    \n    CREATE TABLE Products (\n      ProductID int,\n      ProductName varchar(50),\n      Category varchar(50),\n      UnitPrice decimal(10, 2),\n      Stock int,\n      PRIMARY KEY (ProductID)\n    );\n    \n    CREATE TABLE Customers (\n      CustomerID int,\n      FirstName varchar(50),\n      LastName varchar(50),\n      Email varchar(100),\n      Phone varchar(20),\n      PRIMARY KEY (CustomerID)\n    );"

      response = client.chat_completion(
        model: "companies_mind1",  # Thay thế bằng tên mind bạn đã tạo
        messages: [
          { role: "system", content: system_message },
          { role: "user", content: params[:user_input] }
        ]
      )
      binding.irb
      @generated_sql = response["choices"][0]["message"]["content"]
      @datasources = Datasource.all
      render :index
    end


  private

    def fetch_datasources
      client = Minds::Api::Client.new
      response = client.list_datasources
      response["datasources"]
    end
end
