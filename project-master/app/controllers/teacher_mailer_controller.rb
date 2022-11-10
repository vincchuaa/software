class TeacherMailerController < ApplicationController
before_action :set_post, only: %i[ show edit update destroy ]

def index
    @posts = Teacher.order(created_at: :desc)
    end
def show
  end
def new
    @post = Post.new
  end
def edit
  end


def create
     @teacher = Teacher.new(post_params)
     if @teacher.save
       TeacherMailer.with(user: current_user, post: @teacher).post_created.deliver_later
       redirect_to @teacher, notice: "Post was successfully created."
     else
       render :new, status: :unprocessable_entity
    end
  end
  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @teacher.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end
  private
    def set_post
      @teacher = Teacher.find(params[:id])
    end
    def post_params
      params.require(:teacher).permit(:title, :content)
    end
end

