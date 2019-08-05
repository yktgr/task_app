class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
        if params[:sort_expired]
          # @tasks = Task.all.order(expired_at: :desc)
              @tasks = Task.all.expired
            elsif params[:task] == nil
              @tasks = Task.all
            elsif params[:task][:title].present?
              # @tasks = Task.where('title Like ?',params[:task][:title])
              @tasks = Task.search_title(params[:task][:title])
            elsif params[:task][:status].present?
              # @tasks = Task.where('status = ?',params[:task][:status])
              @tasks = Task.search_status(params[:task][:status])
            elsif params[:task][:title].present? && params[:task][:status].present?
              # @tasks = Task.where('title Like ? and status = ?',params[:task][:title],params[:task][:status])
              @tasks = Task.search_all(params[:task][:title],params[:task][:status])
            elsif params[:task][:search] == "true"
              @tasks = Task.all
        end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "作成しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "削除しました"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title,:content,:expired_at,:status)
  end
end
