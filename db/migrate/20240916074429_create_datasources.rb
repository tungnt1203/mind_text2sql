class CreateDatasources < ActiveRecord::Migration[7.2]
  def change
    create_table :datasources do |t|
      t.string :description
      t.string :type_source
      t.string :host
      t.string :user
      t.string :password
      t.string :port
      t.string :database
      t.string :schema
      t.timestamps
    end
  end
end
