require "application_system_test_case"

class SlabProjectsTest < ApplicationSystemTestCase
  setup do
    @slab_project = slab_projects(:one)
  end

  test "visiting the index" do
    visit slab_projects_url
    assert_selector "h1", text: "Slab Projects"
  end

  test "creating a Slab project" do
    visit slab_projects_url
    click_on "New Slab Project"

    fill_in "Description", with: @slab_project.description
    fill_in "Finish at", with: @slab_project.finish_at
    fill_in "Finished at", with: @slab_project.finished_at
    fill_in "Name", with: @slab_project.name
    fill_in "Start at", with: @slab_project.start_at
    fill_in "Status", with: @slab_project.status
    click_on "Create Slab project"

    assert_text "Slab project was successfully created"
    click_on "Back"
  end

  test "updating a Slab project" do
    visit slab_projects_url
    click_on "Edit", match: :first

    fill_in "Description", with: @slab_project.description
    fill_in "Finish at", with: @slab_project.finish_at
    fill_in "Finished at", with: @slab_project.finished_at
    fill_in "Name", with: @slab_project.name
    fill_in "Start at", with: @slab_project.start_at
    fill_in "Status", with: @slab_project.status
    click_on "Update Slab project"

    assert_text "Slab project was successfully updated"
    click_on "Back"
  end

  test "destroying a Slab project" do
    visit slab_projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Slab project was successfully destroyed"
  end
end
