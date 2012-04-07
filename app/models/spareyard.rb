class Spareyard < ActiveRecord::Base
    acts_as_gmappable :process_geocoding => false

    def gmaps4rails_address
        address
        # "#{self.street}, #{self.city}, #{self.country}" 
        # "Gregorio Espino 34, Vigo, Spain"
    end
end
