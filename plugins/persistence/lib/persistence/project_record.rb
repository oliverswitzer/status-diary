module Persistence
  class ProjectRecord < ActiveRecord::Base
    self.table_name = 'projects'
  end
end
