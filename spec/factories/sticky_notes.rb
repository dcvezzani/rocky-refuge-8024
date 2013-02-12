# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sticky_note do
    controller "MyString"
    action "MyString"
    background_color "MyString"
    height 1
    left 1
    top 1
    width 1
    z_index 1
  end
end
