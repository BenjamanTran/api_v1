module API
  module Supports
    class ReviewFormInput < Base
      def gender_values
        data_sources_exist? ? ::ReviewFormInput.genders.keys : []
      end
    end
  end
end
