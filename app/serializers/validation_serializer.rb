class ValidationSerializer < ActiveModel::Serializer
  attributes :id, :created_at
  belongs_to :team
  belongs_to :exo

  #caching
  cache expires_in: 1.day, skip_digest: true


end
