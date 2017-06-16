class ProjectsController < ApplicationController

before_action:find_project, only: [:show, :edit, :update]

def index
@projects=Project.all.order("created_at desc")
end
def new
@project=Project.new
end

def create 
@project=Project.new user_params

if @project.save
redirect_to @project
else
render 'new'
end
end

def show
end

private

def find_project
@project=Project.find(params[:id])
end

def user_params
params.require(:project).permit(:title, :description, :link)
end
end
