FactoryGirl.define do
  factory :task1, class: Task do
    title 'Do the dishes'
    done false
  end
  factory :task2, class: Task do
    title 'Do the laundry'
    done false
  end
end
