@isTest
public class N26_ProductsController_Test {
    
    @Testsetup
    static void createTestData() {
        //create products
        List<Product2> prodList = N26_TestDataFactory.createProductData(1);
        insert prodList;
        //create home country
        Home_Country__c hCont = N26_TestDataFactory.createHomeCountry();
        insert hCont;
        //create contacts
        Contact cont = N26_TestDataFactory.createContact(1,hCont.Id);
        insert cont;
        //create home relationships
        Home_Country_Relationship__c hcR = N26_TestDataFactory.createRelationship(cont.Id, hCont.Id, prodList[0].Id);
        insert hcR;
        Case csObj = N26_TestDataFactory.createCase(cont.Id);
        insert csObj;
    }
    
    public static testMethod void productControllerTest() {
        Case csObj = [Select Id from Case LIMIT 1];
        String prodId = [Select Id from Product2 LIMIT 1].Id;
        String relId = [Select Id from Home_Country_Relationship__c LIMIT 1].Id;
        String prodJSON = '{"countryName":"Germany","editVisible":false,"isEditable":true,"productId":"'+prodId+'","productName":"GenWatt Diesel 200kWI","tableDataWrapper":[{"amount":"EUR9878","currencyISO":"EUR","isEditable":true,"productType":"Metals","recordId":"'+relId+'"}]}';
        String createProd = '{"countryName":"Germany","editVisible":false,"isEditable":true,"productId":"","productName":"GenWatt Diesel 200kWI","tableDataWrapper":[{"amount":"EUR9878","currencyISO":"EUR","isEditable":true,"productType":"Metals","recordId":""}]}';
		Test.startTest();
        List<N26_CountryDetailsWrapper> wrapList =  N26_ProductsController.getProducts(csObj.Id);
        System.assertEquals(false, wrapList.isEmpty());
        N26_ProductsController.saveProductDetails(prodJSON,csObj.Id);
        N26_ProductsController.createProduct(createProd,csObj.Id);
        Test.stopTest();
        
    }    

}
