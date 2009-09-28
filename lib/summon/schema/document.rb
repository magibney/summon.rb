
class Summon::Document < Summon::Schema
  attr :id, :json_name => "ID"
  attr :title
  attr :subtitle
  attr :publication_title
  attr :publication_series_title
  attr :content_type

  attr :authors, :json_name => "Author"
  attr :publishers, :json_name => "Publisher"
  attr :volume
  attr :issue
  attr :start_page
  attr :end_page
  attr :page_count
  attr :publication_date, :json_name => "PublicationDate_xml",  :transform => :Date
  
  attr :dissertation_advisor
  attr :dissertation_category
  attr :dissertation_degree
  attr :dissertation_degree_date
  attr :dissertation_degree_date_decade
  attr :dissertation_degree_date_century
  attr :dissertation_degree_date_year
  attr :dissertation_school
  
  attr :library
  attr :call_number, :json_name => "LCCallNum"
  attr :doi, :json_name => "DOI"
  attr :isbns, :json_name => "ISBN"
  attr :issns, :json_name => "ISSN"
  attr :patent_number
  
  
  attr :subject_terms
  attr :genres, :json_name => "Genre"
  attr :languages, :json_name => "Language"
  
  attr :snippet #highlight
  attr :abstract
  attr :fulltext, :boolean => true, :json_name => "hasFullText"
  attr :url
  attr :open_url
  attr :subject_terms

  attr :thumbnail_small, :json_name => "Thumbnail-s"
  attr :thumbnail_medium, :json_name => "Thumbnail-m"
  attr :thumbnail_large, :json_name => "Thumbnail-l"
  attr :availability_token


  def isbn
    @isbns.first
  end

  def pages?
    @start_page || @page_count
  end
  
  def publication_date
    @publication_date || Summon::Date.new({})
  end

  def publisher
    @publishers.first
  end
  
  def authors
    @authors.map {|n| Summon::Author.new(n)}
  end
  
  def to_s(options = {})
    "Title: #{title}"
  end
end


class Summon::Author < Struct.new(:name)
  def name(*args)
    super()
  end
end

