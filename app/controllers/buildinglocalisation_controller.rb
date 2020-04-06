class BuildinglocalisationController < ApplicationController

    def building

        # @users = [
        #     {
        #        "latitude" =>46.8009591,
        #        "longitude"=>-71.2955668
        #     },
        #     {
        #         "latitude" =>46.8009591,
        #         "longitude"=>-71.2955668
        #      }
        # ]

        @resp = execute_statement()
        @hash = Gmaps4rails.build_markers(@resp) do |rep, marker|
            marker.lat rep["latitude"]
            marker.lng rep["longitude"]
            marker.infowindow "<b>Number of Floors:</b> "+ rep["nbroffloor"].to_s + "</br><b>Client Full-Name:</b> "+ rep["nameadmin"] + "</br> <b>Technician Full-Name:</b> "+rep["nametech"] + "</br> <b>Address:</b> "+rep["addresse"]+ "</br> <b>Number of Battery:</b> "+rep["nbrofbat"].to_s + "</br> <b>Number of Columns:</b> "+rep["nbrofcol"].to_s + "</br> <b>Number of elevators:</b> "+rep["nbrofelev"].to_s
           
        end
    end

    def execute_statement()
        
        request = "select cus.company_contact_full_name as nameadmin, 
                    b.building_technical_contact_full_name as nametech, 
                    CONCAT(ad.street_number,' ',ad.street_name ,' ', ad.city ,' ',ad.postal_code,' ', ad.country )  as addresse,
                    ad.latitude as latitude,  
                    ad.longitude as longitude,
                    bitem.nbrofbat,
                    bitem.nbrofcol,
                    bitem.nbroffloor,
                    bitem.nbrofelev
            from buildings b
            join addresses ad on ad.entity_id = b.customer_id
            join customers cus on cus.id = b.customer_id 
            join (
                select batitemcount.building_id, 
                    count(batitemcount.bat_id) nbrofbat, 
                    sum(batitemcount.nbrofcol) nbrofcol,
                    sum(batitemcount.nbroffloor) nbroffloor,
                    sum(batitemcount.nbrofelev) nbrofelev
                from (
                    SELECT bat.id bat_id, bat.building_id , 
                        sum(col.served_floor_number) nbroffloor,
                        count(col.id) nbrofcol,
                        (
                            select count(e.id) nbrofelev from `columns` c 
                            join elevators e on e.column_id  = c.id
                            where c.battery_id = bat.id
                            GROUP by c.battery_id
                        ) nbrofelev
                    from batteries bat 
                    join `columns` col on col.battery_id = bat.id 
                    GROUP by bat.id, bat.building_id 
                ) as batitemcount
                GROUP by batitemcount.building_id
            ) as bitem on bitem.building_id = b.id"
        
        
        resp = Building.find_by_sql(request);
      
         if resp.present? 
          return resp
        else
          return nil
        end
      end
    
end



    