class BBcode
  Tags = {
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
      text = text.clone.gsub(/</, '&lt;' ).gsub(/>/, '&gt;' ).gsub(/ /, "&nbsp;" )

      text.scan(/(\[code[:=\s]?(.*?)\](.+?)\[\/code\])/mi).each do |m|
        text.gsub!(m[0],"<div class='code_type'>#{m[1]}</div>" + code2html(m[2].gsub(/&nbsp;/,' ').gsub(/&lt;/,'<').gsub(/&gt;/,'>'),m[1]))
      end

      Tags.map { |k,v| text.gsub!(v[0],v[1])}

      text.gsub!(/[^"]((https?:\/\/|www\.)(\w+\.)*\w+(\/\S*)?)/,'<a href="\1">\1</a>')
      #FIXME only work after some char
      return text.gsub( /\n/, "<br/>" )
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
