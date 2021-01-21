module ApplicationHelper
    def error_display(item)
        item.errors.full_messages.each do |message|
            message
        end
    end
end
