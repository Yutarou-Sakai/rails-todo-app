class BoardsController < ApplicationController

    def index #boardの一覧

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

    private
    def board_params #パラメータを引き渡すためのコード
        params.require(:board).permit(:title, :content)
    end
end
