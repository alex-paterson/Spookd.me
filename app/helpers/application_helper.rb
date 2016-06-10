module ApplicationHelper
    def description(page_title = '')
        base_title = "The home of Snapchat usernames and news."
        if page_title.empty?
            base_title
        else 
            page_title
        end
    end

    def share_image(page_title = '')
        base_title = 'http://spookd.me/cover.png'
        if page_title.empty?
            base_title
        else 
            page_title
        end
    end

    # Returns the full title on a per-page basis.
    def full_title(page_title = '')
        base_title = "Spookd.me"
        if page_title.empty?
            base_title
        else 
            page_title
        end
    end
end
