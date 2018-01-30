class Api::UsersController < ApplicationController

	api :GET, '/users', "Show all users"
	param :user, Hash, :description => "User" do
		param :name, String, desc: "Name", required: true
		param :email, String, desc: "Email", required: true
		param :avatar, ActionDispatch::Http::UploadedFile, desc: "User Image", required: true
	end
	
	def index
		@users = User.all
		render json: @users
	end


	api :GET, "/users/:id", "Show user profile"
	param :id, Integer, desc: "ID", required: true
	param :name, String, desc: "Name", required: true
	param :email, String, desc: "Email", required: true
	param :avatar, ActionDispatch::Http::UploadedFile, desc: "User Image", required: true
	
	def show
		@user = User.find(params[:id])
		render json: @user
	end	
end