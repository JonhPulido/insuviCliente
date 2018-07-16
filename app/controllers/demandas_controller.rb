
		class DemandasController < ApplicationController
			 before_action :authenticate_person!
			
			def index
				demandas= Demanda.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Loadede demandas', data:demandas},status: :ok
			end

			def show
				@cliente = Cliente.find_by_curp(current_person.curp)
				#@demanda = Demanda.find_by_cliente_id(current_person.id)
			end

		
		end
