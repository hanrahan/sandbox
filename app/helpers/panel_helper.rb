module PanelHelper
  def ext_panel(&block)
   yield
    
    javascript_tag <<-_JS
     Ext.onReady(function(){
      var p = new Ext.Panel({
        title: 'My Panel',
        collapsible:true,
        renderTo: 'container',
        width:600,
        html: test
    });
  });
  _JS

    
  end

  def test(&block)
    yield
  end
end
