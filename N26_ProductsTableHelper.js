({
    getProducts : function(component) {
        var action = component.get('c.getProducts');
        action.setParams({
            "recordId":component.get('v.recordId'),
            
        });
        action.setCallback(this,function(response){
            if(response.getReturnValue() != null) {
                console.log(response.getReturnValue());
                component.set('v.productList',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    setTableEditable : function(component,event,helper,valueToSet) {
        var masterList = component.get('v.productList');
        var recId = event.getSource().get('v.value');
        var modifiedList = [];
        for(var i=0;i<masterList.length;i++){
            if(recId === masterList[i].productId){
            masterList[i].isEditable = valueToSet;
                masterList[i].editVisible = masterList[i].editVisible ? false : true;
            //set the innerlist editable
            for(var j=0;j<masterList[i].tableDataWrapper.length;j++){
                masterList[i].tableDataWrapper[j].isEditable = valueToSet;
            }
            
            }
        }
        component.set('v.productList',masterList);
    },
    saveProducts : function(component,event,helper) {
        var prodDetails = event.getSource().get('v.value');
        console.log(JSON.stringify(prodDetails));
         var action = component.get('c.saveProductDetails');
        action.setParams({
            "productDetails": JSON.stringify(prodDetails),
            "recordId":component.get('v.recordId')
        });
        action.setCallback(this,function(response){
            if(response.getReturnValue() != null) {
                console.log(response.getReturnValue());
            }
            this.getProducts(component);
        });
        $A.enqueueAction(action);
    },
    addNewProdType : function(component,event,helper) {
        var prodId = event.getSource().get('v.value');
        var existList; 
        var slctedList = [];
        if(prodId !== '')
        {
           existList = component.get('v.productList');
           for(var i=0;i<existList.length;i++) {
            if(existList[i].productId == prodId) {
                slctedList = existList[i];
            }
        	} 
        } else {
            slctedList = component.get('v.newProductObj');
        }
        var tableData = slctedList.tableDataWrapper;
        var setObj = {
            productType :'',
            amount : '',
            isEditable : true
        };
        tableData.push(setObj);
        slctedList.tableDataWrapper = tableData;
        if(prodId !== ''){
        for(var i=0;i<existList.length;i++) {
            if(existList[i].productId == prodId) {
                existList[i] = slctedList ;
            }
        	}
            component.set('v.productList',existList);
        }else {
           existList = slctedList; 
           component.set('v.newProductObj', existList);
        }
        
    },
    createNewProduct : function(component,event,helper) {
        var prodDetails = component.get('v.newProductObj');
        console.log(prodDetails);
         var action = component.get('c.createProduct');
        action.setParams({
            "productDetails": JSON.stringify(prodDetails),
            "recordId":component.get('v.recordId')
        });
        action.setCallback(this,function(response){
            if(response.getReturnValue() != null) {
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
    }
    
})