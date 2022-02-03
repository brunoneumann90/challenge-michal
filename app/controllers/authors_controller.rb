class AuthorsController < ApplicationController
  before_action :set_author, only: %i[edit update]

  def edit
    authorize @author
  end

  def update
    authorize @author
    if @author.update(author_params)
      redirect_to dashboard_path, notice: "Author sucessfully updated!"
    else
      render :edit
    end
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
