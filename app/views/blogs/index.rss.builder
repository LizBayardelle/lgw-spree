xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Laguna Greenworks Blog"
    xml.description "Learn more about interesting, environmentally friendly, and innovative products."
    xml.link root_url
    # xml.keywords "laguna greenworks, dyson, airblades, hand dryers, fans, air purifiers, lighting, vacuums, floor care, restrooms, environmentally friendly, innovative"
    # xml.tag!("atom:link",  "href"=>"https://www.lagunagreenworks.com/blogs.rss", "rel"=>"self", "type"=>"application/rss+xml")

    @published_blogs.each do |blog|
      xml.item do
        xml.title blog.title
        xml.author Spree::User.find(blog.spree_user_id).email
        xml.description blog.body
        xml.pubDate blog.published_at.to_s(:rfc822)
        xml.link blog_url(blog)
        xml.guid blog_url(blog)
      end
    end
  end
end
