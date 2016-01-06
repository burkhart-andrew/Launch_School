# 3. When running the following code...

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

#We get the following error...

# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
# Why do we get this error and how to we fix it?

#We get this error because bob.name is calling the method 'name=' which is not defined
#by our attr_reader. If we change attr_reader to attr_accessor we will be able to 
#run bob.name.

#change attr_reader to attr_accessor to use the setter methods. 

