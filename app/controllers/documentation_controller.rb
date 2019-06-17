class DocumentationController < ActionController::Base
  include DocsEndpoint

  def show
    endpoint Documentations::Operation::Show
  end
end
