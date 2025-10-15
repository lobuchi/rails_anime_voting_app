class CommentsController < ApplicationController
   helper_method :current_user, :logged_in?

  def create
    @anime = Anime.find(params[:anime_id])
    @comment = @anime.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to anime_path(@anime), notice: "Your comment was Posted"
    else
      redirect_to anime_path(@anime),  alert: "Your comment could not be posted"
    end
  end

    private

  # It says: "When someone submits form data for a comment, I will only
  # allow the 'body' field through. Ignore anything else."
  # This prevents hackers from trying to submit malicious data.
  def comment_params
    params.require(:comment).permit(:body)
  end

end
