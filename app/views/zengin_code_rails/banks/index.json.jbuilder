# frozen_string_literal: true

json.banks @banks do |bank|
  json.partial! bank
end
