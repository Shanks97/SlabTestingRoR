json.extract! slab_project, :id, :name, :description, :status, :start_at, :finish_at, :finished_at, :created_at, :updated_at
json.url slab_project_url(slab_project, format: :json)
