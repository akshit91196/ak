class PostsController < ApplicationController

before_action:find_post, only: [:show,:edit,:update,:destroy]
before_action :authenticate_user!, except: [:index, :show]

def hello 

@posts=Post.all.limit(3).order("created_at desc");
end
def index
end

def new
@post=Post.new
end

def create
@post=Post.new post_params

if @post.save
redirect_to @post, notice:"welcome akshit"
else
render 'new', notice:"Oh no"
end
end

def show
end

def edit
end


def update
if @post.update post_params
redirect_to @post,notice:"well done"
else
render 'edit'
end
end

def destroy
   @post = Post.find(params[:id])
@post.destroy
redirect_to posts_path
end


private

def post_params
params.require(:post).permit(:title,:content,:slug)
end
def find_post
@post=Post.find(params[:id])
end
end