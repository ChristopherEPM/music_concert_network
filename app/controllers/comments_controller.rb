class CommentsController < ApplicationController

  def new
    @concert = get_concert
    @comment = @concert.comments.new
  end

  def show

  end

  def create
    @concert = get_concert
    @comment = @concert.comments.new entry_params

    if @comment.save
      flash[:notice] = "Entry created successfully"
      redirect_to action: :show, controller: 'concert', id: @concert.id #action le indicamos a que parte de este entries_controller le estamos redirirgiendo (sin renderizar vista), controller indica a que controller debe ir
    else
      @errors = @comment.errors.full_messages
      flash[:alert] = "Something was wrong"
      render 'new'
    end

  end


  private # de aqui para abajo metodos privados

  def get_concert
     @_concert ||= Concert.find(params[:concert_id]) #@_project para cachear variables (@_).
  end

   def comment_params # para que no pueda meter codigo de mas desde el navegador, limitamos el contenido de params
     params.require(:comment).permit(:comment, :user)
   end

end
