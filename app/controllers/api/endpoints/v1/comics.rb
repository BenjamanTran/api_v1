class Api::Endpoints::V1::Comics < Grape::API
  version "v1"

  resource :comics do
    # GET /api/v1/comics
    desc 'Return a list of comics'
    get do
      comics = Comic.all
      present comics, with: Api::Entities::Comic
    end

    # GET /api/v1/comics/:id
    desc 'Return a specific comic'
    params do
      requires :id, type: Integer, desc: 'Comic ID'
    end
    get ':id' do
      comic = Comic.find(params[:id])
      present comic, with: Api::Entities::Comic
    end

    # POST /api/v1/comics
    desc 'Create a new comic'
    params do
      requires :title, type: String, desc: 'Title'
      requires :description, type: String, desc: 'Description'
      requires :author, type: String, desc: 'Author'
    end
    post do
      comic = Comic.create!(
        title: params[:title],
        description: params[:description],
        author: params[:author]
      )
      present comic
    end

    # DELETE /api/v1/comics/:id
    desc 'Delete a comic'
    params do
      requires :id, type: Integer, desc: 'Comic ID'
    end
    delete ':id' do
      comic = Comic.find(params[:id])
      comic.destroy
      { message: 'Comic deleted successfully' }
    end
  end
end
