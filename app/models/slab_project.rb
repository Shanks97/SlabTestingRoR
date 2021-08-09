class SlabProject < ApplicationRecord
    has_many :slab_project_task, dependent: :destroy
end
