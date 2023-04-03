class Purchase < HistoryPoint
  default_scope { where(history_type: 1) }

  enum category: {
    food: 5,
    clothes: 6
  }
end
