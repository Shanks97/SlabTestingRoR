require "test_helper"

class SlabProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slab_project = slab_projects(:one)
  end

  test "should get index" do
    get slab_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_slab_project_url
    assert_response :success
  end

  test "should create slab_project" do
    assert_difference('SlabProject.count') do
      post slab_projects_url, params: { slab_project: { description: @slab_project.description, finish_at: @slab_project.finish_at, finished_at: @slab_project.finished_at, name: @slab_project.name, start_at: @slab_project.start_at, status: @slab_project.status } }
    end

    assert_redirected_to slab_project_url(SlabProject.last)
  end

  test "should show slab_project" do
    get slab_project_url(@slab_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_slab_project_url(@slab_project)
    assert_response :success
  end

  test "should update slab_project" do
    patch slab_project_url(@slab_project), params: { slab_project: { description: @slab_project.description, finish_at: @slab_project.finish_at, finished_at: @slab_project.finished_at, name: @slab_project.name, start_at: @slab_project.start_at, status: @slab_project.status } }
    assert_redirected_to slab_project_url(@slab_project)
  end

  test "should destroy slab_project" do
    assert_difference('SlabProject.count', -1) do
      delete slab_project_url(@slab_project)
    end

    assert_redirected_to slab_projects_url
  end
end
