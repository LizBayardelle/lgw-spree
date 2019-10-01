
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "My Company Blog"
    xml.description "This is a blog by My Company"
    xml.link root_url

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
