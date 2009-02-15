module  BBcode
  Tags = {
    :code      => [/\[code(.*?)\](.+?)\[\/code\]/i,'<code\1>\2</code>' ],
    :insert    => [/\[ins\](.*?)\[\/ins\]/mi,'<ins>\1</ins>'],
    :italic    => [/\[i\](.*?)\[\/i\]/mi,'<em>\1</em>'],
    :delete    => [/\[del\](.*?)\[\/del\]/mi,'<del>\1</del>'],
    :strikeout => [/\[s\](.*?)\[\/s\]/mi,'<del>\1</del>'],
    :bold      => [/\[b\](.+?)\[\/b\]/mi,'<strong>\1</strong>' ],
    :underline => [/\[u\](.+?)\[\/u\]/mi,'<u>\1</u>' ],

    :url       => [/\[url=(.+?)\](.+?)\[\/url\]/mi,'<a href="\1">\2</a>' ],
    :url       => [/\[url\](.+?)\[\/url\]/mi,'<a href="\1">\1</a>' ],
    :image     => [/\[img\](.+?)\[\/img\]/mi,'<img src="\1" />' ],
  }

  class << self
    def to_html(text)
      text = text.gsub(/</, '&lt;' ).gsub(/>/, '&gt;' )
      Tags.map { |k,v| text.gsub!(v[0],v[1])}
      return text.gsub(/\r\n?/, "\n" ).gsub( /\n/, "<br />" )
    end
  end
end

class String
  def bbcode_to_html
    BBcode.to_html(self)
  end
end
