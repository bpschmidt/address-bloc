require_relative "entry.rb"
require "csv"

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
   
   def import_from_csv(file_name)
     csv_text = File.read(file_name)
     csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
 
     csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
 
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
    
    def remove_entry_2(name, phone_number, email)
        @entries.each do |entry|
            if name == entry.name && phone_number == entry.phone_number && email == entry.email
                @entries.delete(entry)
                break
            end
        end
    end
    
    def binary_search(name)
             lower = 0
     upper = entries.length - 1


     while lower <= upper
 
       mid = (lower + upper) / 2
       mid_name = entries[mid].name
 
 
       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end
     return nil
    end
end

   
