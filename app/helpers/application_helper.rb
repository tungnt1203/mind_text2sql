module ApplicationHelper
  def render_nav_item(title, path, icon, options = {}, &block)
    active_class = current_page?(path) ? "text-indigo-600" : "text-gray-500 hover:text-gray-800"
    content_tag :li do
      link_to path, class: "flex flex-row items-center h-12 transform hover:translate-x-2 transition-transform ease-in duration-200 #{active_class}", **options do
        concat content_tag(:span, content_tag(:i, nil, class: icon), class: "inline-flex items-center justify-center h-12 w-12 text-lg #{active_class}")
        concat content_tag(:span, title, class: "text-sm font-medium hidden group-hover:block whitespace-nowrap")
        concat(capture(&block)) if block_given?
      end
    end
  end

  def database_icon(type_source)
    case type_source.downcase
    when "clickhouse"
      "bx bxl-c-plus-plus"
    when "mariadb", "mysql"
      "bx bxl-mysql"
    when "postgres"
      "bx bxl-postgresql text-blue-400"
    when "redshift"
      "bx bxl-aws"
    when "snowflake"
      "bx bxs-cloud"
    when "bigquery"
      "bx bxl-google-cloud"
    else
      "bx bx-data"
    end
  end
end
