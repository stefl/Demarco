class Image
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :title
  field :date_from, :type => Date
  field :date_to, :type => Date
  field :time_from, :type => Mongoid::Metastamp::Time
  field :time_to, :type => Mongoid::Metastamp::Time
  field :year, :type => Integer
  field :medium
  field :mediumid
  field :description
  field :catalogue_location
  field :imagesize
  field :large_image
  field :medium_image
  field :small_image
  field :highlight, :type => Boolean, :default => false
  field :catalogue_number
  field :indexed, :type => Boolean

  index :catalogue_number
  index :year

  has_and_belongs_to_many :artists

  #after_save :update_for_search!

  def self.indextank_client
    @client ||= IndexTank::Client.new ENV['SEARCHIFY_API_URL']
  end

  def self.indextank_index
    @indextank_index ||= Image.indextank_client.indexes "images"
  end

  def update_for_search!
    Image.indextank_index.document(self._id.to_s).add({ :text => text_for_search })
    self.indexed = true
    self.save
  end

  def text_for_search
    "#{title} #{description} #{year} #{medium}"
  end

  def title_stripped
    self.title.gsub(/<\/?[^>]*>/, "")
  end

  def self.fulltext_search text
    results = indextank_index.search text
    document_ids = results['results'].collect {|i| i['docid']}
    Image.where({:_id.in => document_ids })
  end

  def self.from_csv path
    $stderr.sync
    CSV.foreach(path,
      :headers           => true,
      :header_converters => :symbol,
      :converters        => :numeric 
    ) do |line|
        attrs = line.to_hash
        attrs[:year] = attrs[:date_from].split("/").last.to_i
        attrs[:date_from]
        attrs[:date_from] = Date.strptime(attrs[:date_from], '%d/%m/%Y') rescue nil
        puts attrs[:date_to]

        attrs[:date_to] = Date.strptime(attrs[:date_to], '%d/%m/%Y') rescue nil

        image = Image.create( attrs )
        if line[:large_image]
          image.catalogue_number = line[:large_image].to_s.gsub("l.jpg","")
          image.save
        end
      end
  end

end
