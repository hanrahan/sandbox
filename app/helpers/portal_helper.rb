module PortalHelper
  def portal(&block)
     portal = Portal.new
     
     yield portal

     concat(portal.open,block.binding)

     portal.columns.each do |c|
       c.portlets.each do |p|
         concat(p.create_portlet,block.binding)
       end
     end

     concat(portal.close,block.binding)

  end

  #
  class Portal
    def initialize
      @columns = Array.new
    end

    def column(&block)
     column = Column.new
     @columns << column
     yield column
    end

    def columns
      @columns
    end

    def open
       '<script>Ext.onReady(function(){'
     end

     def close
       '});</script>'
     end
  end

  #
  class Column
    def initialize
      @portlets = Array.new
    end
    
    def portlet(&block)
      portlet = Portlet.new
      @portlets << portlet
      yield portlet
    end

    def portlets
      @portlets
    end
  end

  #
  class Portlet

     def initialize
      @content = String.new
     end

     def add_content(&block)
       @content = capture(&block)
     end

     def create_portlet
       h = HtmlPanel.new('test2')
       h.create_js
     end
  end

  class HtmlPanel
    def initialize(title)
      @title = title
    end

    def create_js
       "new Ext.Panel({
        title: '#{@title}',
        collapsible:true,
        renderTo: 'container',
        width:400,
      }).load({
           url: 'leads.xml',
           text: 'Loading...',
           timeout: 30,
           scripts: false
       });"
    end
  end
end
