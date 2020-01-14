FactoryBot.define do
  factory :item do
    title{"Test Post"}
    tag_list{ "greeting, hello"}
    content { "Hi there!"}
  end
end
