class AbonocreditosController < ApplicationController
		


		def index
				abonocreditos= Abonocredito.order('fecha DESC');
				render json: {status: 'Exito!', message:'Abonos al credito cargados!', data:abonocreditos},status: :ok
		end


		def show

				
				@cliente = Cliente.find_by_curp(current_person.curp)  
				@demandas = Demanda.where(:cliente_id => @cliente.id_cliente)
				@mensualidades = Mensualidad.find(params[:id])


				@demandas.each do |demanda|

					@creditos = Credito.find_by_demanda_id(demanda.id_demanda)

					if @creditos.clave_credito == @mensualidades.credito_clave
						@mensualidad  = Mensualidad.find(@mensualidades.clave_mensualidad)
					end

				end
	

		end


end
