class NewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :link, :published, :published_datetime
end
