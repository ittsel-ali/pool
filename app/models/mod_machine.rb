module ModMachine
  extend ActiveSupport::Concern

  included do
  end
 
  module ClassMethods
    # 
    # Builds a module with constants assigned to the index passed in the `options` array. Be sure
    # to pass all arguments as you would write them manually. In other words `attribute` and any 
    # constants passed in `options` should be classified case (e.g. ThisModule).
    #
    # `attribute` = Name of the class attribute that should be the module's name. MUST be a attribute
    #               of the class.
    # `options`   = Array of constants identified with `attribute`
    #
    # example
    #     state_machine_for("Category", ["PeerReviewed", "NonPeerReviewed", "CaseStudy"])
    #
    def mod_machine_for(attribute, options=[])
      constants = ""
      options.each_with_index do |constant, index|
        constants << "#{constant} = #{index}; "
      end
      mod = %Q{module #{attribute}; #{constants} end}
      self.module_eval(mod)
      build_boolean_instance_methods(attribute, options)
      build_mutable_instance_methods(attribute, options)
    end
 
    #
    # Builds out the boolean methods for constants defined in `mod_machine_for`.
    # Arguments must follow the same format as the aforementioned method.
    #
    def build_boolean_instance_methods(attribute, options=[])
      options.each do |const|
        class_eval <<-RUBY
          def #{const.to_s.demodulize.tableize.singularize}?
            self.#{attribute.downcase} == #{attribute}::#{const.to_s.demodulize}
          end
        RUBY
      end
    end

    #
    # Builds out mutable update methods for constants defined in `mod_machine_for`.
    # Arguments must follow the same format as the aforementioned method.
    #
    # example
    #   object.case_study!
    #     #=> UPDATE 'objects' SET 'category' = 2 WHERE 'objects'.'id' = 1;
    #   object.case_study?
    #     #=> true
    #
    def build_mutable_instance_methods(attribute, options=[])
      column = ":" + attribute.to_s.downcase
      options.each do |const|
        class_eval <<-RUBY
          def #{const.to_s.demodulize.tableize.singularize}!
            update_attribute #{column}, #{attribute}::#{const.to_s.demodulize}
          end
        RUBY
      end
    end
  end #End ClassMethods
end #End StateMachine
