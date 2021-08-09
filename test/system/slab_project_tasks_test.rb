require "application_system_test_case"

class SlabProjectTasksTest < ApplicationSystemTestCase
  setup do
    @slab_project_task = slab_project_tasks(:one)
  end

  test "visiting the index" do
    visit slab_project_tasks_url
    assert_selector "h1", text: "Slab Project Tasks"
  end

  test "creating a Slab project task" do
    visit slab_project_tasks_url
    click_on "New Slab Project Task"

    fill_in "Description", with: @slab_project_task.description
    fill_in "Execution at", with: @slab_project_task.execution_at
    fill_in "Name", with: @slab_project_task.name
    fill_in "Slab project", with: @slab_project_task.slab_project_id
    fill_in "Status", with: @slab_project_task.status
    click_on "Create Slab project task"

    assert_text "Slab project task was successfully created"
    click_on "Back"
  end

  test "updating a Slab project task" do
    visit slab_project_tasks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @slab_project_task.description
    fill_in "Execution at", with: @slab_project_task.execution_at
    fill_in "Name", with: @slab_project_task.name
    fill_in "Slab project", with: @slab_project_task.slab_project_id
    fill_in "Status", with: @slab_project_task.status
    click_on "Update Slab project task"

    assert_text "Slab project task was successfully updated"
    click_on "Back"
  end

  test "destroying a Slab project task" do
    visit slab_project_tasks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Slab project task was successfully destroyed"
  end
end
