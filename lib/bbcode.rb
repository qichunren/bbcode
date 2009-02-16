module  BBcode
  Tags = {
    :code      => [/\[code(.*?)\](.+?)\[\/code\]/i,'<code\1>\2</code>' ],
    :insert    => [/\[ins\](.*?)\[\/ins\]/mi,'<ins>\1</ins>'],
    :italic    => [/\[i\](.*?)\[\/i\]/mi,'<em>\1</em>'],
    :delete    => [/\[del\](.*?)\[\/del\]/mi,'<del>\1</del>'],
    :strikeout => [/\[s\](.*?)\[\/s\]/mi,'<del>\1</del>'],
    :bold      => [/\[b\](.+?)\[\/b\]/mi,'<strong>\1</strong>' ],
    :underline => [/\[u\](.+?)\[\/u\]/mi,'<u>\1</u>' ],

    :url_src   => [/\[url=(.+?)\](.+?)\[\/url\]/mi,'<a href="\1">\2</a>' ],
    :url       => [/\[url\](.+?)\[\/url\]/mi,'<a href="\1">\1</a>' ],
    :image     => [/\[img\](.+?)\[\/img\]/mi,'<img src="\1"/>' ],
    :dl        => [/\[dl\](.+?)\[\/dl\]/mi,'<dl>\1</dl>' ],
    :dt        => [/\[dt\](.+?)\[\/dt\]/mi,'<dt>\1</dt>' ],
    :dd        => [/\[dd\](.+?)\[\/dd\]/mi,'<dd>\1</dd>' ],

    :size      => [/\[size=['"]?(.*?)['"]?\](.*?)\[\/size\]/im,'<span style="font-size: \1px;">\2</span>'],

    :ul      => [/\[list\](.+)\[\/list\]/mi,'<ul>\1</ul>'],
    :ul_num  => [/\[list([:=]\d+)?\](.+)\[\/list\]/mi,'<ul style="list-style-type: decimal;">\2</ul>'],
    :ul_roman => [/\[list([:=]r)?\](.+)\[\/list\]/mi,'<ul style="list-style-type: lower-roman;">\2</ul>'],
    :ul_latin => [/\[list([:=]\w+)?\](.+)\[\/list\]/mi,'<ul style="list-style-type: lower-latin;">\2</ul>'],
    :list    => [/\[\*\]([^(\[|\<)]+)/mi,'<li>\1</li>'],
    :quote   => [/\[quote\](.*?)\[\/quote\]/mi,'<blockquote>\1</blockquote>'],
    :email   => [/\[email\](.+)\[\/email\]/mi,'<a href="mailto:\1">\1</a>'],
  }

  class << self
    def to_html(text)
      text = text.clone.gsub(/</, '&lt;' ).gsub(/>/, '&gt;' )
      Tags.map { |k,v| text.gsub!(v[0],v[1])}
      text = text.gsub(/\r\n?/, "\n" ).gsub( /\n/, "<br/>" )

      text.scan(/(<code(?:=)?([a-z+\s]*)>(.*?)(<\/code>))/im).each do |match|
        source = match[2]
        lexer = match[1].empty? ? "text" : match[1]
        text.gsub!(match[0],"<div class='code_type'>#{lexer}</div>" + code2html(source,lexer))
      end
      return text
    end

    def code2html(source,lexer = :text,format = :html)
      require 'rubygems'
      require 'coderay'
      return CodeRay.highlight(source,lexer).sub(/(CodeRay)/,"highlight")
    end
  end
end

class String
  def bbcode_to_html
    BBcode.to_html(self)
  end
end
