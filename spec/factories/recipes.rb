FactoryBot.define do
  factory :recipe do
    title { 'Brigadeiro' }
    recipe_type_id { 1 }
    cuisine_id { 1 }
    user_id { 1 }
    difficulty {'Fácil'}
    cook_time { 30 }
    ingredients { 'Leite condensado, manteiga e chocolate em pó' }
    cook_method { 'Misture tudo em uma panela, deixe no fogo enquanto mexe, até começar a desgrudar do fundo' }
  end
end
