class SlabProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_slab_project, only: %i[ show edit update destroy complete ]

  # GET /slab_projects or /slab_projects.json
  def index
    @slab_projects = SlabProject.all
    render :json => @slab_projects.to_json(:include => :slab_project_task)
  end

  # GET /slab_projects/1 or /slab_projects/1.json
  def show
    render :json => @slab_project
  end

  # GET /slab_projects/new
  def new
    @slab_project = SlabProject.new
  end

  # GET /slab_projects/1/edit
  def edit
  end

  # POST /slab_projects or /slab_projects.json
  def create
    @slab_project = SlabProject.new(slab_project_params)

    respond_to do |format|
      if @slab_project.save
        SlabMailer.with(project: @slab_project).project_created.deliver_later

        format.html { redirect_to @slab_project, notice: "Slab project was successfully created." }
        format.json { render :show, status: :created, location: @slab_project }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @slab_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slab_projects/1 or /slab_projects/1.json
  def update
    respond_to do |format|
      if @slab_project.update(slab_project_params)
        format.html { redirect_to @slab_project, notice: "Slab project was successfully updated." }
        format.json { render :show, status: :ok, location: @slab_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @slab_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slab_projects/1 or /slab_projects/1.json
  def destroy
    @slab_project.destroy
    respond_to do |format|
      format.html { redirect_to slab_projects_url, notice: "Slab project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def complete
    if @slab_project.slab_project_task.size > 0
      p @slab_project.slab_project_task
      if !@slab_project.slab_project_task.all? {|x| x.status == "Done"}
        render :json => { errors: ["Some tasks are not completed"] }
      else
        @slab_project.status = "Done"
        if @slab_project.save
          
          render :json => { message: "Completed" }
        else
          render :json => { message: "Error ocurred during completition" }
        end
      end
    else
      render :json => { errors: ["The project has not tasks"] }
    end
  rescue
    render :json => { message: "Error ocurred during completition" }, status: :bad_request
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slab_project
      @slab_project = SlabProject.find(params[:id])
    rescue
      render :json => {errors: ["No slab project with id #{params[:id]}"]}
    end

    # Only allow a list of trusted parameters through.
    def slab_project_params
      params.require(:slab_project).permit(:name, :description, :start_at, :finish_at)
    end
end
