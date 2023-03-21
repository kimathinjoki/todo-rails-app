class TodoSerializer < ActiveModel::Serializer
  attributes :id :title :description :status :priority

  def index_squared

  end

end
