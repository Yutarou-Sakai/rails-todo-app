class TasksController < ApplicationController

    def new
        @board = Board.find(params[:board_id]) #渡ってきたボードのidからボードを検索
        @task = @board.tasks.build #属しているボードからtaskをビルドしている
    end

    def create
        @board = Board.find(params[:board_id]) #どのボードのことかを検索
        @task = @board.tasks.build(task_params) #そのボードに対してtaskをビルド
        if @task.save
            redirect_to board_path(@board), notice: 'コメントを投稿しました'
        else
            flash.now[:error] = '投稿できませんでした'
            render :new
        end
    end


    private
    def task_params
        params.require(:task).permit(:title ,:content, :deadline).merge(user_id: current_user.id, board_id: params[:board_id])
    end
end
