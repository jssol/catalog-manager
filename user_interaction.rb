require_relative './create_classes'
class UserInteraction
  attr_reader :create_classes
  def initialize
     @create_classes = CreateClasses.new
  end  
end
