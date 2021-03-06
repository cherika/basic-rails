class FavoritesController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: post)

		authorize favorite
		if favorite.save
			flash[:notice] = "You have successfully added this as favorite!"
			redirect_to [post.topic, post]
		else
			flash[:error] = "There was an error adding this as favorite. Please try again."
			redirect_to [post.topic, post]
		end
	end

	def destroy
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.find(params[:id])

		authorize favorite
		if favorite.destroy
			flash[:notice] = "This was unfavorited successfully."
			redirect_to [post.topic, post]
		else
			flash[:error] = "There was an error. Please try again."
			redirect_to [post.topic, post]
		end
	end

end
