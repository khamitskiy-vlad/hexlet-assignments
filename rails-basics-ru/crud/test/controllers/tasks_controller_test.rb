require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @attributes = {
      id: @task.id,
      name: @task.name,
      description: @task.description,
      creator: @task.creator,
      performer: @task.performer
    }
  end

  test 'gets index tasks page' do
    get tasks_url

    assert_response :success
    assert_select 'h2', 'Tasks'
  end

  test 'gets new task page' do
    get new_task_path

    assert_response :success
  end

  test 'new task created' do
    new_attributes = @attributes.dup
    new_attributes[:id] += 1

    post tasks_url, params: { task: new_attributes }

    task = Task.find_by! id: new_attributes[:id]

    assert_redirected_to task_url(task)
  end

  test 'gets show task page' do
    get task_url(@task)
    assert_response :success
  end

  test 'task edited' do
    get edit_task_url(@task)
    assert_response :success
  end

  test 'task updated' do
    patch task_url(@task), params: { task: @attributes }
    assert_redirected_to task_url(@task)

    @task.reload

    assert { @task.name == @attributes[:name] }
  end

  test 'task destroy' do
    delete task_url(@task)

    assert_redirected_to tasks_url

    assert { !Task.exists? @task.id }
  end
end
