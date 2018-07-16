
		class ProgramasController < ApplicationController
			 before_action :authenticate_person!
			def index
				programas= Programa.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Loadede programas', data:programas},status: :ok
			end

		
		end
