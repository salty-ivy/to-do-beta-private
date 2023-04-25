class ProjectsController < ApplicationController

	def new
		@project = Project.new
	end

	def create
		if current_user
			@project = current_user.projects.build(project_params)
			puts project_params
			puts @project
			if @current_user.save
				respond_to do |format|
					format.html {redirect_to root_path, notice: "New project created"}
					format.turbo_stream
				end
			else
				render :new, status: :unprocessable_entity
			end
		else
			reder :new, notice: "you are not logged in"
		end

	end

	def show
		@project = Project.find(params[:id])
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
			redirect_to root_path, notice: "Project was successfully updated."
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@project = Project.find(params[:id])
		if @project.users.include? current_user
			if @project.destroy
				respond_to do |format|
					format.html {redirect_to root_path, notice: "Project deleted successfully."}
					format.turbo_stream
				end
				
			else
				redirect_to root_path, notice: "Something went wrong, please try again."
			end
		end
	end

	private
		def project_params
			params.require(:project).permit(:title, :description)
		end
end
