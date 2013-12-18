module CustomHamlEngine
  class HamlTemplate < Tilt::HamlTemplate
    def evaluate(scope, locals, &block)
      scope.class_eval do
        include Rails.application.routes.url_helpers
        include Rails.application.routes.mounted_helpers
        include ActionView::Helpers
      end

      super
    end
  end
end

Rails.application.assets.register_engine '.haml', CustomHamlEngine::HamlTemplate

