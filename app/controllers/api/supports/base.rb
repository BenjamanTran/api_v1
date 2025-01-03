module API
  module Supports
    class Base
      def data_sources_exist?
        ActiveRecord::Base.connection.data_sources.present?
      end
    end
  end
end
