module MarkdownHelper
    def markdown(text)
        options = {
            filter_html: true,
            hard_wrap: true,
            space_after_headers: true
        }

        extensions = {
            autolink: true,
            fenced_code_blocks: true,
            lax_spaciing: true,
            noo_intra_emphasis: true,
            strikethrough: true,
            superscript: true,
            tables: true
        }

        renderer = Redcarpet::Render::HTML.new(options)
        @markdown = Redcarpet::Markdown.new(renderer,extensions)
      @markdown.render(text).html_safe
    end
end