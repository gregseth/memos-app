require 'htmlentities'

helpers do
    def format_category cat 
        name        = cat[:name] 
        separator   = (cat[:name].empty? ? ' ' : ': ') 
        list        = cat[:values].map do |info| 
            info[:cls] = info[:link].end_with?('md') ? 'markdown' : ''
            haml '%a{href: link, class: cls } #{lbl}', locals: info
        end.join(' | ')
        
        name + separator + list
    end

    def format_line l
        coder = HTMLEntities.new
        l = coder.encode( l )

        l.sub! /\t/, ' ' * 4
        l.sub! /\n/, ''
            
        l.sub /(http:\/\/[^[:space:]]+)/, '<a href="\1">\1</a>' 
    end
end

