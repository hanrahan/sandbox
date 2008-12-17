require 'test_helper'

class MenuTest < ActiveSupport::TestCase

  def test_get_external_menus
    menus = Menu.get_external_menus

    assert menus

    puts menus.to_json
  end
  
end
