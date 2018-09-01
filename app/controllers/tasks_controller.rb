# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update]
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.where(status: 'pending').sort_by(&:date)
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to '/tasks', notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:date, :status, :description)
  end
end
