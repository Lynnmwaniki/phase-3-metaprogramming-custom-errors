class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  #raising our custom error
  #implement the rescue 
  # If the object passed into the method as an argument is not an instance of the Person class, we will begin our error handling. First, we raise our PartnerError, then we rescue our PartnerError. The rescue method creates an instance of the PartnerError class and puts out the result of calling message on that instance.
  def get_married(person)
    if person.is_a?(Person)
      self.partner = person
      person.partner = self
    else
      begin
        raise PartnerError
      rescue PartnerError => error
        puts error.message
      end
    end
  end

#defining the custom error class
# add custom error message 
  class PartnerError < StandardError
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name




