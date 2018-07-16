
class MensualidadesController < ApplicationController
			 before_action :authenticate_person!
			def index
				mensualidades= Mensualidad.order('fecha_vencimiento DESC');
				render json: {status: 'SUCCESS', message:'Mensualidades cargadas correctamente', data:mensualidades},status: :ok
			end

			def show

				@creditos = Credito.find(params[:id])
				@cliente = Cliente.find_by_curp(current_person.curp)  
				@demandas = Demanda.where(:cliente_id => @cliente.id_cliente)

				 @demandas.each do |demanda|
      				if @creditos.demanda_id == demanda.id_demanda
      					@credito = Credito.find(params[:id])
      				end
      				
   				 end
				
			end

		
end
