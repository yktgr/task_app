class TasksController < ApplicationController
  before_action :access_user
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :edit_task, only: [:show, :edit, :update, :destroy]
  PER = 5
  def index
        if params[:sort_expired]
      # @tasks = Task.all.order(expired_at: :desc)
          @tasks = Task.all.expired.page(params[:page]).per(PER)
        elsif params[:sort_priority]
          @tasks = Task.all.priority.page(params[:page]).per(PER)
        elsif params[:task] == nil
          @tasks = Task.page(params[:page]).per(PER)
        elsif params[:task][:title].present? && params[:task][:status].blank?
          # @tasks = Task.where('title Like ?',params[:task][:title])
          @tasks = Task.search_title(params[:task][:title]).page(params[:page]).per(PER)
        elsif params[:task][:status].present? && params[:task][:title].blank?
          # @tasks = Task.where('status = ?',params[:task][:status])
          @tasks = Task.search_status(params[:task][:status]).page(params[:page]).per(PER)
        elsif params[:task][:title].present? && params[:task][:status].present?
          # @tasks = Task.where('title Like ? and status = ?',params[:task][:title],params[:task][:status])
          @tasks = Task.search_all(params[:task][:title],params[:task][:status]).page(params[:page]).per(PER)
        elsif params[:task][:search] == "true"
          @tasks = Task.all.page(params[:page]).per(PER)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
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
    params.require(:task).permit(:title,:content,:expired_at,:status,:priority,:user_id)
  end

  def edit_task
      if current_user.id != @task.user_id
        flash[:notice] = "権限がありません"
        redirect_to tasks_path
      end
  end


end
