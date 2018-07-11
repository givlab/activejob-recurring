module Activejob
  module Recurring
    module Mixin
      extend ActiveSupport::Concern

      included do
        class_attribute :_recurrences, default: {}
      end

      class_methods do
        def repeat(every: nil, cron: nil)
          raise ArgumentError, "you must provide either every or cron" if every.nil? && cron.nil?
          self._recurrences = {}
          self._recurrences[:every] = every if every
          self._recurrences[:cron] = cron if cron
        end
      end
    end
  end
end
