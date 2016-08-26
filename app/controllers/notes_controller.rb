class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_note, only: %i(edit update destroy)
  before_action :set_my_notes, only: %i(index create)
  before_action :set_my_teams, only: %i(index create)

  def index
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.project = current_user.current_project

    redirect_url = params[:return_to] || notes_url

    if @note.save
      redirect_to redirect_url, notice: 'ノートを投稿しました。'
      session[:latest_project_id_in_note] = @note.project.id
    else
      render :index
    end
  end

  def update
    redirect_url = params[:return_to] || notes_url

    if @note.update(note_params)
      redirect_to redirect_url, notice: 'ノートを編集しました。'
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
      @notes = current_user.notes.order(:id)
    end

    def set_my_teams
      @teams = current_user.teams
    end

    def note_params
      params.require(:note).permit(:body)
    end
end
