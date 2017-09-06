class AccountsController < ApplicationController

 def index
   @accounts = Account.order("name asc").all

 end 

 def show
   @account = Account.find(params[:id])
   respond_to do |format|
      format.html
      format.pdf do
        render pdf:                            'scheda_cliente',
               layout:                         'pdf'
      end
    end
 end

end
