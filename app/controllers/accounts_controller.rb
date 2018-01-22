class AccountsController < ApplicationController

 def index
   @accounts = Account.order("name asc").all
 end 
 
 def without_call_and_meetings
   @accounts = Account.where(deleted:0).order("name asc").all.map{|a| a if a.calls.blank? && a.meetings.blank? && a.opportunities.count == 0}.compact
   render :index 
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

 def google_map
   @markers="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
   @account = Account.find(params[:id])
   @locations = @account.account_location.accounts_by_range(15).limit(30)
   location =@account.account_location
   @google_link="https://maps.googleapis.com/maps/api/staticmap?center="
   @google_link += URI.encode(location.jjwg_maps_address_c)
   @google_link += "&zoom=10&size=640x640&scale=2&maptype=roadmap&"
   @google_link += URI.encode("markers=color:blue|label:C|#{location.jjwg_maps_lat_c},#{location.jjwg_maps_lng_c}")
   
   @locations.each_with_index do |x,i|
     @google_link += URI.encode("&markers=color:green|label:#{@markers[i]}|#{x.jjwg_maps_lat_c},#{x.jjwg_maps_lng_c}")
   end
   #&markers=color:green%7Clabel:G%7C40.711614,-74.012318"
   respond_to do |format|
      format.html
      format.pdf do
        render layout:                         'pdf'
      end
    end
 end


end
