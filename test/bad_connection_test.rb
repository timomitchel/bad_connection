require "minitest/autorun"
require "minitest/pride"
require "./lib/bad_connection"

#When running tests type "a" and enter when prompted for user input to see tests run
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

  def test_empty_inputs
    connection = BadConnection.new
    connection.empty_inputs

    assert_equal 1, connection.empty_input_count
    assert_equal [nil], connection.empty_input
  end

  def test_lowercase_question
    connection = BadConnection.new

    assert_equal 0, connection.lowercase_questions_count

    connection.lowercase_question

    assert_equal 1, connection.lowercase_questions_count
    assert_equal [nil], connection.lowercase_questions
  end

  def test_uppercase_question
    connection = BadConnection.new

    assert_equal 0, connection.uppercase_questions_count

    connection.uppercase_question

    assert_equal 1, connection.uppercase_questions_count
    assert_equal [nil], connection.uppercase_questions
  end

  def test_first_goodbye
    connection = BadConnection.new
    connection.first_goodbye

    assert_equal 1, connection.goodbye_count
    assert_equal [nil], connection.goodbyes
  end

  def test_second_goodbye
    connection = BadConnection.new
    connection.second_goodbye

    assert_equal [nil], connection.goodbyes
    assert_equal true, connection.ready_to_quit
  end

end
