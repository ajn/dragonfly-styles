module Dragonfly
  module ActiveModelExtensions
    class Attachment
      class InvaidGeometryOrStyleNameError < StandardError; end
      
      def style style_name_or_geometry, format=nil
        scope = case style_name_or_geometry
        when Symbol # style_name => :small_rectangle
          style current_styles[style_name_or_geometry], format
        when String # geometry => '100x80'
          job.thumb style_name_or_geometry
        when Array # geometry + format => ['100x80', :gif]
          style *style_name_or_geometry
        when Proc  # Proc for style => lambda { thumb('100x80').process(:greyscale).encode(:png) }
          job.instance_eval &style_name_or_geometry
        else
          raise InvaidGeometryOrStyleNameError
        end
        scope = scope.encode(format) if format
        scope
      end
      
      def current_styles
        parent_model.class.dragonfly_styles_for_attributes[attribute_name.to_sym] || {}
      end
      
    end
  end
end
