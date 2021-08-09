class SlabProjectTasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_slab_project_task, only: %i[ show edit update destroy complete ]

  # GET /slab_project_tasks or /slab_project_tasks.json
  def index
    @slab_project_tasks = SlabProjectTask.all
    render :json => @slab_project_tasks.to_json(:include => :slab_project)
  end

  # GET /slab_project_tasks/1 or /slab_project_tasks/1.json
  def show
    render :json => @slab_project_task
  end

  # GET /slab_project_tasks/new
  def new
    @slab_project_task = SlabProjectTask.new
  end

  # GET /slab_project_tasks/1/edit
  def edit
  end

  # POST /slab_project_tasks or /slab_project_tasks.json
  def create
    @slab_project_task = SlabProjectTask.new(slab_project_task_params)
    @slab_project_task.status = "InProgress"

    p params
    c = { message: "Created" }
    
    respond_to do |format|
      if @slab_project_task.save
        format.html { redirect_to @slab_project_task, notice: "Slab project task was successfully created." }
        format.json { render :show, status: :created, location: @slab_project_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @slab_project_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slab_project_tasks/1 or /slab_project_tasks/1.json
  def update
    respond_to do |format|
      if @slab_project_task.update(slab_project_task_params)
        format.html { redirect_to @slab_project_task, notice: "Slab project task was successfully updated." }
        format.json { render :show, status: :ok, location: @slab_project_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @slab_project_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slab_project_tasks/1 or /slab_project_tasks/1.json
  def destroy
    @slab_project_task.destroy
    respond_to do |format|
      format.html { redirect_to slab_project_tasks_url, notice: "Slab project task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def complete
    raise "A"
    @slab_project_task.status = "Done"
    if @slab_project_task.save
      render :json => {message: "Ok completed"}
    else
      render :json => { errors: "Could save task id #{params[:id]}" }
    end
  rescue
    render :json => { errors: "An error ocurred while procesing your request" }, status: :bad_request
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slab_project_task      
      @slab_project_task = SlabProjectTask.find(params[:id])
    rescue 
      render :json => {errors: ["No Task for id #{params[:id]}"]}
    end

    # Only allow a list of trusted parameters through.
    def slab_project_task_params
      params.require(:slab_project_task).permit(:name, :description, :execution_at, :slab_project_id)
    end
end
