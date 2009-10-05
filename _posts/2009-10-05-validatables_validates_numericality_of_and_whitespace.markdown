---
layout: post
title: Validatable's validates_numericality_of and whitespace
published: false
---

{% highlight ruby %}
# lib/validations/validates_numericality_of.rb

module Validatable 
  class ValidatesNumericalityOf < ValidationBase #:nodoc:
    option :only_integer
    
    def valid?(instance)
      value = instance.send(self.attribute).to_s
      regex = self.only_integer ? /\A[+-]?\d+\Z/ : /^\d*\.{0,1}\d+$/
      not (value =~ regex).nil?
    end
    
    def message(instance)
      super || "must be a number"
    end
  end
end
{% endhighlight %}

{% highlight ruby %}
# activerecord/lib/validations.rb

def validates_numericality_of(*attr_names)
   configuration = { :on => :save, :only_integer => false, :allow_nil => false }
   configuration.update(attr_names.extract_options!)


   numericality_options = ALL_NUMERICALITY_CHECKS.keys & configuration.keys

   (numericality_options - [ :odd, :even ]).each do |option|
     raise ArgumentError, ":#{option} must be a number" unless configuration[option].is_a?(Numeric)
   end

   validates_each(attr_names,configuration) do |record, attr_name, value|
     raw_value = record.send("#{attr_name}_before_type_cast") || value

     next if configuration[:allow_nil] and raw_value.nil?

     if configuration[:only_integer]
       unless raw_value.to_s =~ /\A[+-]?\d+\Z/
         record.errors.add(attr_name, :not_a_number, :value => raw_value, :default => configuration[:message])
         next
       end
       raw_value = raw_value.to_i
     else
       begin
         raw_value = Kernel.Float(raw_value)
       rescue ArgumentError, TypeError
         record.errors.add(attr_name, :not_a_number, :value => raw_value, :default => configuration[:message])
         next
       end
     end

     numericality_options.each do |option|
       case option
         when :odd, :even
           unless raw_value.to_i.method(ALL_NUMERICALITY_CHECKS[option])[]
             record.errors.add(attr_name, option, :value => raw_value, :default => configuration[:message])
           end
         else
           record.errors.add(attr_name, option, :default => configuration[:message], :value => raw_value, :count => configuration[option]) unless raw_value.method(ALL_NUMERICALITY_CHECKS[option])[configuration[option]]
       end
     end
   end
 end
{% endhighlight %}
