class TasksController < ApplicationController
  before_action :access_user
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :edit_task, only: [:show, :edit, :update, :destroy]
  PER = 5
# require byebug
  def index
    if params[:key]
        @tasks = User.find(params[:key]).tasks.all.page(params[:page]).per(PER)
      elsif params[:sort_expired]
        @tasks = current_user.tasks.all.expired.page(params[:page]).per(PER)
      elsif params[:sort_priority]
        @tasks =  current_user.tasks.all.priority.page(params[:page]).per(PER)
      elsif params[:task] == nil
        @tasks =  current_user.tasks.page(params[:page]).per(PER)
      elsif params[:task][:label_id].present?
        labels =  TaskLabel.where('label_id = ?',params[:task][:label_id]).pluck(:task_id)
        tasks = current_user.tasks.find(labels)
        @tasks = Kaminari.paginate_array(tasks).page(params[:page]).per(PER)
      # elsif params[:task][:label_id].present?
      # labels =  TaskLabel.where('label_id = ?',params[:task][:label_id]).pluck(:task_id)
      # tasks = current_user.tasks.search_label(labels)
      # @tasks = Kaminari.paginate_array(tasks).page(params[:page]).per(PER)

      elsif params[:task][:title].present? && params[:task][:status].blank?
        @tasks =  current_user.tasks.search_title(params[:task][:title]).page(params[:page]).per(PER)
      elsif params[:task][:status].present? && params[:task][:title].blank?
        @tasks =  current_user.tasks.search_status(params[:task][:status]).page(params[:page]).per(PER)
      elsif params[:task][:title].present? && params[:task][:status].present?
        @tasks =  current_user.tasks.search_all(params[:task][:title],params[:task][:status]).page(params[:page]).per(PER)
      elsif params[:task][:search] == "true"
        @tasks =  current_user.tasks.all.page(params[:page]).per(PER)
    end
  end

  def new
    # @task = Task.new
     @task = current_user.tasks.build
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
    @labels = @task.labels
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
    params.require(:task).permit(:title,:content,:expired_at,:status,:priority,:user_id, label_ids:[])
  end

  def edit_task
      if current_user.id != @task.user_id
        flash[:notice] = "権限がありません"
        redirect_to tasks_path
      end
  end
end
