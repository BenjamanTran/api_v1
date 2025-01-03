class Api::Entities::Comic < Grape::Entity
  expose :id, documentation: { type: Integer, desc: "Comic ID", required: true, example: 1 }
  expose :title, documentation: { type: String, desc: "Comic name", required: true, example: "Example Comic" }
  expose :description, documentation: { type: String, desc: "Comic description", required: true, example: "example-comic" }
  expose :author, documentation: { type: String, desc: "Comic author", example: "This is description" }
end
