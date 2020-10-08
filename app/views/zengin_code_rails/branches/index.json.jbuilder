# frozen_string_literal: true

json.branches @branches do |branch|
  json.partial! branch
end
