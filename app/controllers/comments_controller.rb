class CommentsController < ApplicationController
    before_action :set_task, only: [:new, :create]

    def new
        @comment = task.comments.build
    end

    def create
        @comment = task.comments.build(comment_params)
        if @comment.save
            redirect_to task_path(task), notice: 'コメントを投稿しました'
        else
            flash.now[:error] = '投稿できませんでした'
            render :new
        end
    end


    private
    def comment_params
        params.require(:comment).permit(:content).merge(
            user_id: current_user.id, task_id: params[:task_id]
        ) #コメントのcontentしか保存しない設定
    end

    def set_task
        task = Task.find(params[:task_id])
    end
end
