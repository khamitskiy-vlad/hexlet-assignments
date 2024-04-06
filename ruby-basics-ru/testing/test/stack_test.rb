# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack_element = Stack.new
  end
  
  def test_was_element_added_with_push!
    expected_result = %w(ruby)
    assert(@stack_element.push!('ruby') == expected_result)
  end

  def test_was_element_deleted_with_pop!
    poped_element = 'ruby'
    @stack_element.push!('ruby')
    assert(@stack_element.pop! == poped_element)
  end

  def test_was_element_cleared_with_clear!
    expected_result = []
    @stack_element.push!('ruby')
    assert(@stack_element.clear! == expected_result)
  end

  def test_empty_method_from_stack
    assert(@stack_element.empty?)
  end

  def teardown; end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
