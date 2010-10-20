module Dragonfly
  module ActiveModelExtensions
    module ClassMethods
      def register_dragonfly_styles macro_name, app
        (class << self; self; end).class_eval do
          # Defines e.g. 'image_styles' for any activerecord class body
          define_method macro_name do |attribute, styles|
            # Register the new styles
            dragonfly_styles_for_attributes[attribute] = styles
          end
        end
        app
      end

      def dragonfly_styles_for_attributes
        @dragonfly_styles_for_attributes ||= begin
          parent_class = ancestors.select{|a| a.is_a?(Class) }[1]
          parent_class.respond_to?(:dragonfly_styles_for_attributes) ? parent_class.dragonfly_styles_for_attributes.dup : {}
        end
      end

    end
  end
end