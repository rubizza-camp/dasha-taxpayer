# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_tax, only: %i[completed failed]

  def index
    @tasks = Task.where(status: 'pending')
  end

  def completed
    @task.completed

    redirect_to tasks_path
  end

  def failed
    @task.failed
    redirect_to tasks_path
  end

  private

  def set_tax
    @task = Task.find(params[:id])
  end
end
