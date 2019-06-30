# frozen_string_literal: true

module V1::Projects::Query
  class Index
    def self.call(user_id, relation = Project.all)
      relation.where(user_id: user_id).order(:created_at)
    end
  end
end
