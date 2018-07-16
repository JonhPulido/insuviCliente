
		class ArticlesController < ApplicationController
			def index
				articles = Article.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Loadede articles', data:articles},status: :ok
			end

			
			def destroy
				articles = Article.find(params[:id])
				articles.destroy
				render json: {status: 'SUCCESS', message:'delated articles', data:articles},status: :ok
			end

		end
