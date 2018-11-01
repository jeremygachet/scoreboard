class News < ApplicationRecord
    validates :link, format: URI::regexp(%w(http https)), :allow_blank => true

  

end
