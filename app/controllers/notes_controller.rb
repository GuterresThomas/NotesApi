class NotesController < ApplicationController
    def index   
        notes = Note.all
        render json: notes
    end

    def show
        @note = Note.find(params[:id])
        render json: notes
    end    
    def def create
        @note = Note.new(note_params)
        if @note.save
          flash[:success] = "Note successfully created"
          render json: notes
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def update
        @note = Note.find(params[:id])
        if @note.update_attributes(params[:note])
          flash[:success] = "Note was successfully updated"
          render json: notes
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        @note = Note.find(params[:id])
        if @note.destroy
            flash[:success] = 'Note was successfully deleted.'
              render json: notes
        else
            flash[:error] = 'Something went wrong'
              render json: notes
        end
    end

    
    
    
    
end
