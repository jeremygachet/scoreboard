class NewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :published, :published_datetime
end
