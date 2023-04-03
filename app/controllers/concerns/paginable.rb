module Paginable
  extend ActiveSupport::Concern

  def prepare_pagination
    @page = params[:page] || 1
    @limit = params[:limit] || 10
  end

  def paginated_response(query_records)
    paginated_records = query_records.page(@page).per(@limit)
    { resources: paginated_records, total_pages: paginated_records.total_pages, current_page: paginated_records.current_page }
  end
end