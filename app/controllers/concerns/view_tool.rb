module ViewTool
  extend ActiveSupport::Concern
  
  included do 
    before_action :set_copyright
  end
  
  def set_copyright
    @copyright = "&copy; #{Time.now.year} | <b>Ben Grether</b> All rights reserved".html_safe
  end 
  
end








