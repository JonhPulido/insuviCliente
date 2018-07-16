class WelcomeController < ApplicationController
  def index

  	if current_person.nil?
      render layout: "member"
    else
    @cliente = Cliente.find_by_curp(current_person.curp)  
    end



  end

 
end
