require "test_helper"

class SlabProjectTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slab_project_task = slab_project_tasks(:one)
  end

  test "should get index" do
    get slab_project_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_slab_project_task_url
    assert_response :success
  end

  test "should create slab_project_task" do
    assert_difference('SlabProjectTask.count') do
      post slab_project_tasks_url, params: { slab_project_task: { description: @slab_project_task.description, execution_at: @slab_project_task.execution_at, name: @slab_project_task.name, slab_project_id: @slab_project_task.slab_project_id, status: @slab_project_task.status } }
    end

    assert_redirected_to slab_project_task_url(SlabProjectTask.last)
  end

  test "should show slab_project_task" do
    get slab_project_task_url(@slab_project_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_slab_project_task_url(@slab_project_task)
    assert_response :success
  end

  test "should update slab_project_task" do
    patch slab_project_task_url(@slab_project_task), params: { slab_project_task: { description: @slab_project_task.description, execution_at: @slab_project_task.execution_at, name: @slab_project_task.name, slab_project_id: @slab_project_task.slab_project_id, status: @slab_project_task.status } }
    assert_redirected_to slab_project_task_url(@slab_project_task)
  end

  test "should destroy slab_project_task" do
    assert_difference('SlabProjectTask.count', -1) do
      delete slab_project_task_url(@slab_project_task)
    end

    assert_redirected_to slab_project_tasks_url
  end
end
