require_relative "entry.rb"

class AddressBook
    attr_accessor :entries
    
    def initialize
        @entries = []
    end
      
   def add_entry(name, phone, email)
       
        index = 0
     @entries.each do |entry|
 
       if name < entry.name
         break
       end
       index += 1
     end
 
     @entries.insert(index, Entry.new(name, phone, email))
   end
   
    def remove_entry(name, phone_number, email)
        # Going to leave notes in line...
        # I initially thought this would work too. But it doesn't...
        # the == method only returns true if they are the exact same object in this case.
        # Since they are technically two different objects in memory, this will not find the match.
        # try checkint email against entry.email, and phone against entry.phone. It's more verbose,
        # but it should get the job done!
       @entries.delete_if { |entry| name == entry.name && phone_number == entry.phone_number && email == entry.email } 
    end
end

   
