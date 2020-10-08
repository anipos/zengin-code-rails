# frozen_string_literal: true

json.cache! bank.code do
  json.call(
    bank,
    :code,
    :name,
    :kana,
    :hira,
    :roma
  )
end
