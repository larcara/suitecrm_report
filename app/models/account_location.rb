class AccountLocation < SuitecrmRecord
    self.table_name = "accounts_cstm"
    self.primary_key="id_c"
    has_one :account, foreign_key: :id
    reverse_geocoded_by :jjwg_maps_lat_c, :jjwg_maps_lng_c
 #   default_scope {where("1=1")}
    def name
     account.name
    end
    def accounts_by_range(km)
	center_point = [self.jjwg_maps_lat_c, self.jjwg_maps_lng_c]
	box = Geocoder::Calculations.bounding_box(center_point, km)
	AccountLocation.joins(:account).where(["(jjwg_maps_lat_c between ? and ?) and (jjwg_maps_lng_c between ? and ?)",box[0],box[2],box[1],box[3]])
    end
      
end

