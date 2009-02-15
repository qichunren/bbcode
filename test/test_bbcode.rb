require File.dirname(__FILE__) + '/test_helper.rb'

class TestBBCode < Test::Unit::TestCase
  def test_strong
    assert_equal '<strong>simple</strong>', '[b]simple[/b]'.bbcode_to_html
  end
  
  def test_em
    assert_equal '<em>simple</em>', '[i]simple[/i]'.bbcode_to_html
  end
  
  def test_u
    assert_equal '<u>simple</u>', '[u]simple[/u]'.bbcode_to_html
  end
  
  def test_del
    assert_equal '<del>simple</del>', '[del]simple[/del]'.bbcode_to_html
    assert_equal '<del>simple</del>', '[s]simple[/s]'.bbcode_to_html
  end
    
  def test_ins
    assert_equal '<ins>simple</ins>', '[ins]simple[/ins]'.bbcode_to_html
  end  
  
  def test_code
    assert_equal '<code>simple</code>', '[code]simple[/code]'.bbcode_to_html
  end  
end
