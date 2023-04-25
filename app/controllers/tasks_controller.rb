class TasksController < ApplicationController
	def show
		@task = Task.find(params[:id])
		@section  = @task.section
	end

	def new
		@section = Section.find(params[:section_id])
		@task = @section.tasks.build
	end

	def create
		@section = Section.find(params[:section_id])
		@project = @section.project

		if @project.users.include? current_user
			@task = @section.tasks.build(task_params)

			if @task.save
				respond_to do |format|
					format.html {redirect_to projects_path(@project)}
					format.turbo_stream
				end
			else
				render :new, status: :unprocessable_entity
			end
		end
	end

	def edit
		@task = Task.preload(:section).find(params[:id])
	end

	def update
		@task = Task.preload(section: :project).find(params[:id])
		if @task.section.project.users.include? current_user
			if @task.update(task_params)
				redirect_to task_path(@task), notice: "Task successfully updated."
			else
				render :edit, statu: :unprocessable_entity
			end
		end
	end

	def destroy
		@task = Task.preload(section: :project).find(params[:id])
		@project = @task.section.project

		if @task.destroy
			respond_to do |format|
				format.html { redirect_to project_path(@project), notce: "Task successfully deleted" }
				format.turbo_stream
			end
		else
			redirect_to project_path(@project), notice: "Something went wrong, please try again"
		end
	end

	private
		def task_params
			params.require(:task).permit(:title, :description)
		end
end
