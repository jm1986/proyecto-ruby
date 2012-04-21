class CommentsController < ApplicationController

    def create

        @post = Post.find (params[:post_id])
        @commment = @post.comments.create(params[:comment])
        redirect_to @post, :notice => 'Comment created'
    end
end
