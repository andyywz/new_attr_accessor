class Object
  def self.new_attr_accessor(*method_names)
    method_names.each do |name|
      var_name = "@#{name}"
      define_method("#{name}=".to_sym) do |value|
        self.instance_variable_set(var_name,value)
      end

      define_method(name) do
        self.instance_variable_get(var_name)
      end
    end
  end
end

=begin test code
class Cat
  new_attr_accessor :name, :color
end


cat = Cat.new
p cat.name
cat.name = "Breakfast"
cat.color = "Black"

p cat.name
p cat.color
=end