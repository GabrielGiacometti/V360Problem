class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update  ]

  # GET /tasks or /tasks.json
  def index
    if !Task.count.zero?
    @tasks = Task.where(main_task_id: nil)
    end
  end

  def sub
    @main_task = Task.find(params[:id])
    @task = Task.new
    @task.main_task = @main_task
  end

  def delAll
      Task.destroy_all
      redirect_to tasks_path, notice: 'All tasks were successfully deleted.'
  end
  # GET /tasks/1 or /tasks/1.json
  def show
    
  end

  # GET /tasks/new
  def new
    @task = Task.new(done: false)
  end

  # GET /tasks/1/edit
  def edit
    response.headers['Access-Control-Allow-Origin'] = 'http://127.0.0.1:3000/tasks'
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    
    respond_to do |format|
      if @task.update(task_params) 
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
       
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
      @sub_tasks = @task.sub_task
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :done, :main_task_id)
    end
end
