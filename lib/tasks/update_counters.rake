namespace :hackerboard do
  desc "Update counter cache attributes"
  task "update_counters" => :environment do
    Category.find_each do |category|
      Category.reset_counters(category.id, :questions)
    end

    Question.find_each do |question|
      Question.reset_counters(question.id, :comments)
    end
  end
end
