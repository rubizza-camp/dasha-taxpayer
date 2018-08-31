# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update]
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.where(status: 'pending').sort_by(&:date)
  end

  def edit; end

  # This method smells of :reek:DuplicateMethodCall
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to '/tasks', notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_tax
    @task = Task.find(params[:id])
  end

  def task_params
    permited_params = params.require(:task).permit(:date)
    permited_params
  end
end
