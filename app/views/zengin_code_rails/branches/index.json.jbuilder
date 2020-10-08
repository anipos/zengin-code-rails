# frozen_string_literal: true

json.cache! @branches do
  json.branches @branches do |branch|
    json.partial! branch
  end
end
