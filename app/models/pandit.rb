class Pandit < ActiveRecord::Base
   
 def self.to_csv(file)
   CSV.generate do |csv|
     csv << ["Name","address","phone"]
     all.each do |f|
       csv << [f.name,f.address,f.phone]
     end
   end
 end
end
