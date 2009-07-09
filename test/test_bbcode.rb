require File.dirname(__FILE__) + '/test_helper.rb'

class TestBBCode < Test::Unit::TestCase
  def test_tags
    tags = {
      '[size=32]12pxText[/size]' => '<span style="font-size: 32px;">12pxText</span>',
      '[size=32]12pxText[/size]' => '<span style="font-size: 32px;">12pxText</span>',

      '[list][*]item1[*]item2[/list]' => '<ul><li>item1</li><li>item2</li></ul>',
      '[list=1][*]item1[*]item2[/list]' => '<ul style="list-style-type: decimal;"><li>item1</li><li>item2</li></ul>',
      '[list=a][*]item1[*]item2[/list]' => '<ul style="list-style-type: lower-latin;"><li>item1</li><li>item2</li></ul>',
      '[list=r][*]item1[*]item2[/list]' => '<ul style="list-style-type: lower-roman;"><li>item1</li><li>item2</li></ul>',
      '[img]www.zhangjinzh.com/welcome.jpg[/img]' => '<img src="www.zhangjinzh.com/welcome.jpg"/>',
      '[quote]zhangjinzhu[/quote]'  => '<blockquote>zhangjinzhu</blockquote>',
      '[email]wosmvp@gmail.com[/email]' => '<a href="mailto:wosmvp@gmail.com">wosmvp@gmail.com</a>',
      ' http://124.mv.com/d' => '&nbsp<a href="http://124.mv.com/d">http://124.mv.com/d</a>',
    }
    tags.map { |k,v| assert_equal k.bbcode_to_html,v }

    tags = {'i' => 'em','b' => 'strong','u' => 'u','del' => 'del','s' => 'del','ins' => 'ins'}
    tags.map do |k,v|
      assert_equal "[#{k}]simple[/#{k}]".bbcode_to_html, "<#{v}>simple</#{v}>"
    end

    assert_equal '[b]simple[/b]'.bbcode_to_html,'<strong>simple</strong>'
    assert_equal '[b]<i>foobar</i>[/b]'.bbcode_to_html,"<strong>&lt;i&gt;foobar&lt;/i&gt;</strong>"
  end
end
