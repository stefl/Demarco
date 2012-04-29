class Artist
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields
  include Mongoid::Slugify

  field :name
  field :description
  field :dbpedia_url

  has_and_belongs_to_many :images

  private
  def generate_slug
    name.parameterize
  end
end
