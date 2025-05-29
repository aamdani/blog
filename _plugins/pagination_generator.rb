module Jekyll
  class PaginationGenerator < Generator
    safe true

    def generate(site)
      # Get all entries
      entries = site.collections["entries"].docs
      entries_count = entries.size
      
      # Calculate total pages (10 entries per page)
      total_pages = (entries_count.to_f / 10).ceil
      
      # Skip if only one page or no entries
      return if total_pages <= 1 || entries_count == 0
      
      # Generate pagination pages (start from page 2 since page 1 is the main entries page)
      (2..total_pages).each do |page_num|
        site.pages << PaginationPage.new(site, site.source, "entries/page", page_num)
      end
    end
  end
  
  class PaginationPage < Page
    def initialize(site, base, dir, page_num)
      @site = site
      @base = base
      @dir = dir
      @name = "#{page_num}.html"
      
      self.process(@name)
      self.read_yaml(File.join(base, "_layouts"), "paginated_entries.html")
      
      self.data["title"] = "Dev Log Entries - Page #{page_num}"
      self.data["pagination_info"] = {"page" => page_num}
    end
  end
end 