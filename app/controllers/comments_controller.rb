class CommentsController < ApplicationController

    def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end

    def create
        task = Task.find(params[:task_id])
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
end
