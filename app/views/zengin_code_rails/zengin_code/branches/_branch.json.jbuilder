# frozen_string_literal: true

json.cache! branch do
  json.call(
    branch,
    :code,
    :name,
    :kana,
    :hira,
    :roma
  )
end
