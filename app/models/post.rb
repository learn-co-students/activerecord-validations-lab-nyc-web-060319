class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, {length: {minimum: 250}}
    validates :summary, {length: {maximum: 250}}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :title, :clickbait_title

    CLICKBAIT = ["Won't Believe", "Secret", "Top", "Guess"]
    def clickbait_title
        if CLICKBAIT.none?{|x| (title != nil) && title.include?(x) }
            errors.add(:title, "not clickbaity enough!")
        end
    end
end
