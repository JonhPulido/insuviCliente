

		class ClientesController < ApplicationController
			 before_action :authenticate_person!
			
			def index
			@cliente = Cliente.find_by_curp(current_person.curp)
				#order('fecha_nac DESC');
				#render json: {status: 'SUCCESS', message:'Loadede clientes', data:clientes},status: :ok
			end

			def show
				
				@cliente = Cliente.find(params[:id])
			end

		
		end
