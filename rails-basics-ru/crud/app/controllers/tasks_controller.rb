# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[update show destroy edit]

  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    if @task.save
      flash[:success] = 'New task has been created'

      redirect_to task_path(@task)
    else
      flash[:failure] = "Task can't be created"

      render :new, status: :unprocessably_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task has been updated'

      redirect_to task_path(@task)
    else
      flash[:failure] = "Task can't be updated"

      render :edit
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = 'Task has been deleted'

      redirect_to tasks_path
    else
      flash[:failure] = "Task can't be deleted"

      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.required(:task).permit(:name, :description, :creator, :performer)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
