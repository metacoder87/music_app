class NotesController < ApplicationController
  before_action :require_user!

  # GET /notes/new
  def new
    @note = Note.new
    render :new
  end

  # POST /notes or /notes.json
  def create
    @note = current_user.notes.new(note_params)

    respond_to do |format|
      @note.save
        format.html { redirect_to track_url(@note.track_id), notice: "Note was successfully created." }
    end
  end
  
  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to track_url(@note.track_id), notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:track_id, :user_id, :content)
    end
end
