module Api
  class Base < Grape::API
    format :json
    default_format :json
    content_type :json, "application/json"
    prefix :api

    rescue_from :grape_exceptions

    insert_before Grape::Middleware::Error, GrapeLogging::Middleware::RequestLogger,
                  {
                    logger: logger,
                    formatter: GrapeLogging::Formatters::Json.new,
                    include: [GrapeLogging::Loggers::FilterParameters.new([:password])]
                  }

    helpers do
      include Helpers
    end

    mount Api::Endpoints::V1::Comics

    add_swagger_documentation(
      api_version: "v1",
      hide_documentation_path: false,
      mount_path: "/swagger_doc",
      hide_format: true
    )
  end
end
