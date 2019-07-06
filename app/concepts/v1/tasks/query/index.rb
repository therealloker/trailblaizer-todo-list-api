# frozen_string_literal: true

module V1::Tasks::Query
  class Index
    def self.call(user_id, relation = Task.all)
      relation.where(user_id: user_id).order(:created_at)
    end
  end
end
