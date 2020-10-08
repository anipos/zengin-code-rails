# frozen_string_literal: true

json.cache! bank.code do
  json.extract!(
    bank,
    :code,
    :name,
    :kana,
    :hira,
    :roma
  )
end
