class BoardsController < ApplicationController
    before_action :set_board, only: [:edit, :update, :destroy]

    def index #boardの一覧
        @boards = Board.all
    end

    def show
        @board = Board.find(params[:id])

        @task = Task.new
        @tasks = @board.tasks
    end

    def new
        @board = current_user.boards.build #フォームに空の初期値を渡す
    end

    def create
        @board = current_user.boards.build(board_params) #空の箱にフォームからのデータを入れる
        if @board.save
            redirect_to boards_path(@board), notice: '保存ができました'
        else
            flash.now[:error] = '保存できませんでした'
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update(board_params)
            redirect_to board_path(@article), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    def destroy
        @board.destroy! #!マークで例外ができる
        redirect_to root_path, notice: '削除しました'
    end



    private
    def board_params #パラメータを引き渡すためのコード
        params.require(:board).permit(:title, :content)
    end

    def set_board
        @board = current_user.boards.find(params[:id])
    end
end
