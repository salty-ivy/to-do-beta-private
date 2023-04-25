class SectionsController < ApplicationController

	def show
		@section = Section(params[:id])

		render "show"
	end

	def new
		@project = Project.find(params[:project_id])
	end

	def create
		@project = Project.find(params[:project_id])
		if @project.users.include? current_user 
			@section = @project.sections.build(section_params)
			if @section.save
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
		@project = Project.find(params[:project_id])
		@section = @project.sections.find(params[:id])
	end

	def update
		@project = Project.find(params[:project_id])

		if @project.users.include? current_user
			@section = @project.sections.find(params[:id])
			if @section.update(section_params)
				redirect_to project_path(@project), notice: "Project was successfully updated."
			else
				render :edit, status: :unprocessable_entity
			end
		end
	end

	def destroy
		@project = Project.find(params[:project_id])
		@section = @project.sections.find(params[:id])

		if @project.users.include? current_user
			if @section.destroy
				respond_to do |format|
					format.html {redirect_to project_path(@project)}
					format.turbo_stream
				end
			else
				redirect_to project_path(@project), notice: "Something went wrong please try again."
			end
		end

	end

	private
		def section_params
			params.require(:section).permit(:name)
		end
end
