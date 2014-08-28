class TasksController < ApplicationController
  def index
    @tasks = Task.all.not_done
    render('tasks/index.html.erb')
  end

  def new
    @task = Task.new
    render('tasks/new.html.erb')
  end

  def create
    @task = Task.create(:name => params[:name])

    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/new.html.erb')
    end
  end

  def show
    @task = Task.find(params[:id])
    render('tasks/find.html.erb')
  end

  def edit
    @task = Task.find(params[:id])
    render('tasks/edit.html.erb')
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(:name => params[:name], :done => params[:done])
      render('tasks/success.html.erb')
    else
      render('tasks/edit.html.erb')
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render('tasks/destroy.html.erb')
  end

  def not_done
    Task.where(:done => false)
  end

  def done
    @task = Task.find(params[:id])
    @task.done = true
    render('tasks/index.html.erb')
  end



end
