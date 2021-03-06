require "jekyll-import"

JekyllImport::Importers::Tumblr.run({
  "url"            => "http://klubbdinmamma.com",
  "format"         => "html", # "html" or "md"
  "grab_images"    => true,   # whether to download images as well.
  "image_class"    => "news-photo", # add this class to the <img> tag
  "add_highlights" => false,  # whether to wrap code blocks (indented 4 spaces) in a Liquid "highlight" tag
  "rewrite_urls"   => false,  # whether to write pages that redirect from the old Tumblr paths to the new Jekyll paths
})
