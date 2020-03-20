class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    brackets = { "{" => "}", "(" => ")", "[" => "]" }
    brackets_stack = []
    valid = true

    record.title.each_char.with_index do |x, i|
      brackets_stack << [brackets[x], i] if brackets.key?(x)

      if brackets.value?(x)
        last_bracket = brackets_stack.pop
        if last_bracket.nil? || last_bracket[0] != x || last_bracket[1] + 1 == i
          valid = false
          break
        end
      end
    end

    record.errors.add(:title, "has unclosed bracket") unless brackets_stack.empty? && valid
  end
end
