require File.dirname(__FILE__) + '/test_helper.rb'

class TestBBCode < Test::Unit::TestCase
  def test_strong
    assert_equal '<strong>simple</strong>', '[b]simple[/b]'.bbcode_to_html
  end

  def test_simple
    tags = {'i' => 'em','b' => 'strong','u' => 'u','del' => 'del','s' => 'del','ins' => 'ins','code' => 'code'}
    tags.map do |k,v|
      assert_equal "[#{k}]simple[/#{k}]".bbcode_to_html, "<#{v}>simple</#{v}>"
    end
  end

  def test_complex
    tags = {
      '[size=32]12px Text[/size]' => '<span style="font-size: 32px;">12px Text</span>',
      '[size=32]12px Text[/size]' => '<span style="font-size: 32px;">12px Text</span>',

      '[list][*]item 1[*]item 2[/list]' => '<ul><li>item 1</li><li>item 2</li></ul>',
      '[list=1][*]item 1[*]item 2[/list]' => '<ul style="list-style-type: decimal;"><li>item 1</li><li>item 2</li></ul>',
      '[list=a][*]item 1[*]item 2[/list]' => '<ul style="list-style-type: lower-latin;"><li>item 1</li><li>item 2</li></ul>',
      '[list=r][*]item 1[*]item 2[/list]' => '<ul style="list-style-type: lower-roman;"><li>item 1</li><li>item 2</li></ul>',

      '[url=www.zhangjinzh.com]ZhangJinzhu[/url]' => '<a href="www.zhangjinzh.com">ZhangJinzhu</a>',
      '[img]www.zhangjinzh.com/welcome.jpg[/img]' => '<img src="www.zhangjinzh.com/welcome.jpg"/>',
      '[quote]zhangjinzhu[/quote]'  => '<blockquote>zhangjinzhu</blockquote>',
      '[email]wosmvp@gmail.com[/email]' => '<a href="mailto:wosmvp@gmail.com">wosmvp@gmail.com</a>',
    }
    tags.map { |k,v| assert_equal k.bbcode_to_html,v }
  end

  def test_html
    assert_equal '[b]<i>foobar</i>[/b]'.bbcode_to_html,"<strong>&lt;i&gt;foobar&lt;/i&gt;</strong>"
  end
end
