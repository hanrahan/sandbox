class Menu
  BASE_URI = 'http://hanrahan-03:8080/olympus/rest/menus/all'
  
  attr_accessor :text, :expanded, :children

  def initialize(caption,children)
    @caption = caption
    @children = children
  end
  
  def self.get_external_menus
     response = Net::HTTP.get_response(URI.parse(BASE_URI)).body

     response_document = REXML::Document.new(response)

     menus = Array.new

     REXML::XPath.each(response_document,"//menu") do |n|

        menuCaption = REXML::XPath.first(n,"menuCaption").text

        children = Array.new
        REXML::XPath.each(n,"subMenus") do |s|
          
            subMenus = Hash.new

            subMenuId = REXML::XPath.first(s,"menuId").text
            subMenuCaption = REXML::XPath.first(s,"menuCaption").text

            subMenus[:text] = subMenuCaption
            subMenus[:id] = 'subMenuCaption'+subMenuId
            subMenus[:uri] = 'menus/tabs/'+subMenuId
            subMenus[:leaf] = true

            children << subMenus

        end

        menu = Menu.new(menuCaption,children)

        menus << menu
      end
      menus
  end
end
