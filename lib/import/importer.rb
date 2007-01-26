
module Import
  
  class Importer
    def initialize(verbose=false)
      @verbose = verbose
    end
    
    def log(message)
      puts message if @verbose
    end

    def clean_title(title)
      title = title.sub("*", "")
      case title
      when /^(.*) \/ [^.]*\. (\(\()?(.*)$/
        title = $1 + ". " + $3 
      when /^(.*) \/ [^;]* (; .*)$/
        title = $1 + $2 
      when /^(.*) \/ [^;.:]*.$/
        title = $1 
      end
      title.gsub(" :", ":").gsub(" ;", ";")
    end

  end
  
end