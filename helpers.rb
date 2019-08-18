require 'htmlentities'

helpers do
    def format_category cat 
        name        = cat[:name] 
        separator   = (cat[:name].empty? ? ' ' : ': ') 
        list        = cat[:values].map do |i| 
            '<a href="%s" class="%s">%s</a>' % [i[:link], i[:class],  i[:lbl]]
#            link_to i[:lbl], i[:link], class: i[:class]
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

