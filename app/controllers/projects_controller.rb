class ProjectsController < ApplicationController
    def index
        @project_items = Project.all
    end
    
    def new
        @project_item = Project.new
    end
    
    def create
        @project_item = Project.new(params.require(:project).permit(:title, :subtitle, :body))

        respond_to do |format|
            if @project_item.save
                format.html { redirect_to projects_path, notice: 'Project item was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end
    
    def edit
        @project_item = Project.find(params[:id])
    end
    
    def update
        @project_item = Project.find(params[:id])
        
        respond_to do |format|
            if @project_item.update(params.require(:project).permit(:title, :subtitle, :body))
                format.html { redirect_to projects_path, notice: 'The record successfully updated.' }
                format.json { render :show, status: :ok, location: @project }
            else
                format.html { render :edit }
                format.json { render json: @project.errors, status: :unprocessable_entity }
            end
        end
    end
    
end
