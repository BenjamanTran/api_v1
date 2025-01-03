module API
  module Supports
    class Seniority < Base
      def seniority_name_values
        data_sources_exist? ? ::Master::Seniority.all.pluck(:name) : []
      end
    end
  end
end
