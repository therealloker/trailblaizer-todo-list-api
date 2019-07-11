# frozen_string_literal: true

module V1::Tasks::Query
  class Index
    def self.call(user_id:, important: nil, done: nil, relation: Task.all)
      scoped = relation.where(user_id: user_id)
      scoped = scoped.where(important: important) unless important.nil?
      scoped = scoped.where(done: done) unless done.nil?
      scoped = scoped.order(:created_at)
      scoped
    end
  end
end
