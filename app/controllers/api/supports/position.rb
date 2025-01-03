module API
  module Supports
    class Position < Base
      def position_name_values
        data_sources_exist? ? ::Master::Position.all.pluck(:name) : []
      end
    end
  end
end
