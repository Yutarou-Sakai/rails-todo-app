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

    def show
        @task = Task.find(params[:id])
        @comments = @task.comments
    end

    def edit
        @task = current_user.tasks.find(params[:id])
    end

    def update
        @task = current_user.tasks.find(params[:id])
        if @task.save
            redirect_to task_path, notice: 'プロフィールを更新しました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    def destroy
        task = current_user.tasks.find(params[:id])
        task.destroy! #!マークで例外ができる
        redirect_to board_path(Task.board_id), notice: '削除しました'
    end


    private
    def task_params
        params.require(:task).permit(
            :eyecatch ,:title ,:content, :deadline
        ).merge(user_id: current_user.id, board_id: params[:board_id])
    end
end
