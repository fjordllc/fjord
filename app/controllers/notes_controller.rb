class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_note, only: %i(edit update destroy)
  before_action :set_my_notes, only: %i(index create)

  def index
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user

    if @note.save
      redirect_to notes_url, notice: 'ノートを投稿しました。'
    else
      render :index
    end
  end

  def update
    if @note.update(note_params)
      redirect_to notes_url, notice: 'ノートを編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'ノートを削除しました。'
  end

  private
    def set_my_note
      @note = current_user.notes.find(params[:id])
    end

    def set_my_notes
      @notes = current_user.notes
    end

    def note_params
      params.require(:note).permit(:body, :project_id)
    end
end
