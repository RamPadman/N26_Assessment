({
    loadProducts : function(component, event, helper) {
        helper.getProducts(component);
    },
    editProducts : function(component,event,helper) {
        helper.setTableEditable(component,event,helper,true);
    },
    cancelAction : function(component,event,helper) {
        helper.getProducts(component);
        helper.setTableEditable(component,event,helper,false);
    },
    saveProducts : function(component,event,helper) {
        helper.saveProducts(component,event,helper);
       // helper.setTableEditable(component,event,helper,false);
    },
    addProducts : function(component,event,helper) {
        helper.addNewProdType(component,event,helper);
    },
    addNewProducts : function(component) {
        var objList = component.get('v.productList');
        if(objList.length > 0) {
            var newObj =  objList[0];
            newObj.tableDataWrapper = [];
            newObj.productName = '';
            newObj.productId = ''; 
            newObj.isEditable = true;
        }
        component.set('v.newProductObj',newObj);
        var modlPopup = component.find('newModal');
        modlPopup.show();
    },
    createNewProducts : function(component,event,helper) {
        helper.createNewProduct(component,event,helper);
    }
    
})