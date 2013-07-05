class Object
  def self.new_attr_accessor(*method_names)
    method_names.each do |name|
      define_method("#{name}=") do |value|
        self.instance_variable_set("@#{name}",value)
      end

      define_method(name) do
        self.instance_variable_get("@#{name}")
      end
    end
  end
end


class Cat
  new_attr_accessor :name, :color
end


cat = Cat.new
p cat.name
cat.name = "Breakfast"
cat.color = "Black"

p cat.name
p cat.color
