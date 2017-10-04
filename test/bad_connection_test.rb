require "minitest/autorun"
require "minitest/pride"
require "./lib/bad_connection"

class BadConnectionTest < Minitest::Test

  def test_that_class_exist_and_initialize_methods_setup_correct
    connection = BadConnection.new

    assert_instance_of BadConnection, connection
    assert_equal false, connection.ready_to_quit
    assert_equal 0, connection.goodbye_count
    assert_equal [], connection.all_input
    assert_equal [], connection.empty_input
    assert_equal 0, connection.empty_input_count
    assert_equal [], connection.lowercase_questions
    assert_equal 0, connection.lowercase_questions_count
    assert_equal [], connection.uppercase_questions
    assert_equal 0, connection.uppercase_questions_count
    assert_equal [], connection.goodbyes
    assert_equal 0, connection.goodbye_count
  end

  def test_start_method
    connection = BadConnection.new
    connection.start
    #type "a" without a question mark

    assert_equal true, connection.ready_to_quit
  end


end
