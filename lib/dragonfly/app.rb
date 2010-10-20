module Dragonfly
  class App
    def define_styles_macro mod, macro_name
      already_extended = (class << mod; self; end).included_modules.include?(ActiveModelExtensions)
      mod.extend(ActiveModelExtensions) unless already_extended
      mod.register_dragonfly_styles(macro_name, self)
    end
  end
end