class TodoSerializer < ActiveModel::Serializer
  attributes :title :description :status :priority :index_squared

  def index_squared

    self.object.id = index 
    index * index

  end

end
