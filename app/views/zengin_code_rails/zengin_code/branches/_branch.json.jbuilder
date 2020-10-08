# frozen_string_literal: true

json.cache! branch do
  json.extract!(
    branch,
    :code,
    :name,
    :kana,
    :hira,
    :roma
  )
end
