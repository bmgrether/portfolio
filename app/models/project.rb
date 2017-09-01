class Project < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image
    
    def self.ruby_on_rails
        where(subtitle: "Ruby on Rails")
    end
end
