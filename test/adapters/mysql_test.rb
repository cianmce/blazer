require_relative "../test_helper"

class MysqlTest < ActionDispatch::IntegrationTest
  def test_run
    run_query "SELECT 12345", data_source: "mysql"
  end

  def test_binary_data
    run_query 'SELECT UNHEX("F6746573745F636F6E74656E74"), 54321', data_source: "mysql"
    puts "response.body: #{response.body}"
    assert_match "54321", response.body
  end

  def test_tables
    get blazer.tables_queries_path(data_source: "mysql")
    assert_response :success
    assert_empty JSON.parse(response.body)
  end
end
