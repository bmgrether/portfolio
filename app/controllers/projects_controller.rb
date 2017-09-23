class ProjectsController < ApplicationController
    layout 'project'
    
    def index
        @project_items = Project.all
    end
    
    def new
        @project_item = Project.new
        3.times { @project_item.technologies.build }
    end
    
    def create
        @project_item = Project.new(project_params)

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
            if @project_item.update(project_params)
                format.html { redirect_to projects_path, notice: 'The record successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end
    
    def show
        @project_item = Project.find(params[:id])
    end
    
    def destroy
        @project_item = Project.find(params[:id])
        
        @project_item.destroy
        respond_to do |format|
            format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
        end
    end
    
    private
    
    def project_params
        params.require(:project).permit(:title, :subtitle, :body, technologies_attributes: [:name])
    end

end

