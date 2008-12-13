var regions = [];

var columns = [];

Ext.onReady(function(){

    Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

    var viewport = new Ext.Viewport({
        layout:'border',
        items: regions
    });

});

var center_region = {
    xtype:'portal',
    region:'center',
    margins:'35 5 5 0',
    items: columns
};

regions.push(center_region);

var column_59954_panels = [];

var html_panel_59958 = new Ext.Panel({
    title: 'test2',
    collapsible:true,
    renderTo: 'container',
    width:400
}).load({
    url: 'leads',
    text: 'Loading...',
    timeout: 30,
    scripts: false
});

column_59954_panels.push(html_panel_59958);

var column_59954 = {
    columnWidth:33,
    style:'padding:10px 0 10px 10px',
    items: column_59954_panels
};

columns.push(column_59954);

var column_59956_panels = [];

var html_panel_59960 = new Ext.Panel({
    title: 'test2',
    collapsible:true,
    renderTo: 'container',
    width:400
}).load({
    url: 'leads',
    text: 'Loading...',
    timeout: 30,
    scripts: false
});

column_59956_panels.push(html_panel_59960);

var column_59956 = {
    columnWidth:33,
    style:'padding:10px 0 10px 10px',
    items: column_59956_panels
};

columns.push(column_59956);