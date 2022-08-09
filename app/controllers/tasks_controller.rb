class TasksController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @tasks = Task.all

        render json: @tasks
    end

    def create
        @tasks = Task.create(description: params[:description], time: params[:time], shouldRemind: [:shouldRemind])
        
        render json: @tasks
    end

    def show
        @task = Task.find(params[:id])

        render json: @task
    end

    def update
        @task = Task.find(params[:id])
        @task.update(description: params[:description], time: params[:time], shouldRemind: params[:shouldRemind])
        
        render json: "Task #{@task.id} updated successfully!"
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        render json: "Task #{@task.id} has been deleted."
    end
end
