class PostsController < ApplicationController

    skip_before_action :set_current_user

    def index
        posts = Post.all

        if params[:user_id] != nil
            filtered_post = posts.select{|post| post[:user_id] == params[:user_id].to_i}
            render json: filtered_post

        elsif params[:title] && params[:category]
            filtered_post = posts.select{|post| post[:title].split(" ").include? params[:title] }
            full_filtered_post = filtered_post.select{ |post| post[:category] == params[:category]}
            render json: full_filtered_post

        elsif params[:title] != nil 
            filtered_post = posts.select{|post| post[:title].split(" ").include? params[:title]}
            render json: filtered_post

        elsif params[:category] != nil 
            filtered_post = posts.select{|post| post[:category] == params[:category]}
            render json: filtered_post
            
        else
            render json: posts
        end
    end 

    def destroy 
        post = Post.find_by(id: params[:id])
        # byebug
        if post.user_id == params[:userid]
            post.delete()
        end 
    end

    def create 
        post = Post.create(title: params[:title], user_id: params[:user_id], price: params[:price].to_i, postcode: params[:postcode], city: params[:city], description: params[:description], image_url: params[:image_url], condition: params[:condition], urgent: false, category: params[:category])
        render json: post
    end 

    def update 
        post = Post.find_by(id: params[:post][:id])
        post.update(title: params[:post][:title], user_id: params[:post][:user_id], price: params[:post][:price].to_i, postcode: params[:post][:postcode], city: params[:post][:city], description: params[:post][:description], image_url: params[:post][:image_url], condition: params[:post][:condition], urgent: false, category: params[:post][:category])
        render json: post
    end

    def show 
        post = Post.find_by(id: params[:id])
        user = User.find_by(id: post.user_id)
        render json: [post, user]
    end
end
