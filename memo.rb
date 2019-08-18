require 'rdiscount'

class Memo                                                                                           
    attr_reader :name, :lines                                                                        
                                                                                                     
    DefaultPage = 'dev.txt'                                                                              
    AllowedExtensions = { text: 'txt', markdown: 'md' }                                        
    BaseDir = '../memos'
                                                                       
    def initialize(name)   
        # The dev page is the default                                                                          
        @name = name || DefaultPage                                                        
        # Defaulting to 404
        @lines = %x{figlet -f banner3 -w 80 -c 404}.split("\n")

        filepath = File.join( BaseDir, @name )                        
        if File.exists?(filepath)                                                                    
            @path = filepath                                                                         
            @name = File.basename(@path, File.extname(@path))
            @lines = File.open(@path, 'r:UTF-8').readlines                                       
        end                                                                                      
    end                                                                                              
                                                                                                     
    def exists?                                                                                      
        !@path.nil?                                                                                  
    end                                                                                              
                                                                                                     
    def path                                                                                         
        File.basename(@path) if exists?                                                          
    end                                                                                              
                                                                                                     
    def last_modified                                                                                
        File.mtime(@path).strftime('%F') if exists?
    end                                                                                              

    def is_markdown?
        exists? && @path.end_with?(AllowedExtensions[:markdown])
    end
                                                                                                     
    def markdown                                                                                     
        RDiscount.new(@lines.join).to_html if is_markdown?
    end                                                                                              
end                                                                                                  
