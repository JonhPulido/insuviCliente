

		class UsersController < ApplicationController
			def index
				users= User.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Loadede users', data:users},status: :ok
			end

			def show	
				users = User.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loadede users', data:users},status: :ok
			end

			def destroy
				users = User.find(params[:id])
				users.destroy
				render json: {status: 'SUCCESS', message:'delated user', data:users},status: :ok
			end

		end
