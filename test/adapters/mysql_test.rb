require_relative "../test_helper"

class MysqlTest < ActionDispatch::IntegrationTest
  def test_run
    run_query "SELECT 1", data_source: "mysql"
  end

  def test_binary_data
    puts "mysql_test_binary_data"
    run_query 'select unhex("F6"), 123', data_source: "mysql"
    puts "mysql_test_binary_data end"
    puts response.body
  end

  def test_tables
    get blazer.tables_queries_path(data_source: "mysql")
    assert_response :success
    assert_empty JSON.parse(response.body)
  end
end
