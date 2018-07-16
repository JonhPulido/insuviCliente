class CreditosController < ApplicationController
			
  
			def index
				if current_person
				creditos= Credito.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Creditos cargados!', data:creditos},status: :ok
				else

					redirect_to root_path, :notice => 'Logeate para Continuar!'
				
				end
			end

				


			def show
				if current_person

					@cliente = Cliente.find_by_curp(current_person.curp)  
					@demandas = Demanda.where(:cliente_id => @cliente.id_cliente)
					@demanda = Demanda.find(params[:id])
				else

					redirect_to root_path, :notice => 'Logeate para Continuar!'
				
				end

			end

end

			

		
	
