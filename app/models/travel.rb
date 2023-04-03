class Travel < HistoryPoint
  default_scope { where(history_type: 0) }
end
