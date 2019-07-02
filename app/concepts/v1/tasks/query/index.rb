# frozen_string_literal: true

module V1::Tasks::Query
  class Index
    def self.call(project_id, relation = Task.all)
      relation.where(project_id: project_id).order(:created_at)
    end
  end
end
