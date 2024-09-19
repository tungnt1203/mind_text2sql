class Datasource < ApplicationRecord
  validates :description, :type_source, :host, :user, :password, :port, :database, presence: true
  validates :port, numericality: { only_integer: true, greater_than: 0 }

  def test_connection
    case type_source.downcase
    when "postgres"
      test_postgresql_connection
    when "mysql"
      test_mysql_connection
    # Thêm các loại cơ sở dữ liệu khác ở đây
    else
      errors.add(:base, "Unsupported database type: #{type_source}")
      false
    end
  rescue => e
    errors.add(:base, "Connection failed: #{e.message}")
    false
  end

  private

  def test_postgresql_connection
    require "pg"
    conn = PG.connect(connection_config)
    conn.exec("SELECT 1")
    conn.close
    true
  end

  def test_mysql_connection
    require "mysql2"
    client = Mysql2::Client.new(connection_config)
    client.query("SELECT 1")
    client.close
    true
  end

  def connection_config
    {
      host: host,
      user: user,
      password: password,
      port: port,
      dbname: database
    }
  end
end
