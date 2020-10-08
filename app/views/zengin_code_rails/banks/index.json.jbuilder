# frozen_string_literal: true

json.cache! @banks do
  json.banks @banks do |bank|
    json.partial! bank
  end
end
