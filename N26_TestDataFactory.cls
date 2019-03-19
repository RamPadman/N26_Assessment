@isTest
public class N26_TestDataFactory {
    
    public static List<Product2> createProductData(Integer count) {
        Product2 prod;
        List<Product2> prodList = new List<Product2>();
        for(Integer i=0;i<count;i++) {
            prod = new Product2();
            prod.Name = 'Test'+i;
            prodList.add(prod);
        }
       return prodList;
    }
    
    public static Case createCase(String contactId) {
        Case csObj = new Case();
        csObj.ContactId = contactId;
		csObj.Subject = 'Test Case';
		return csObj;        
    }
    
    public static Home_Country__c createHomeCountry() {
        Home_Country__c homeCountry = new Home_Country__c();
        homeCountry.Name = 'German';
        homeCountry.Currency_ISO_Code__c = 'EUR';
        return homeCountry;
    }
    
    public static Contact createContact(Integer count, String homeContId) {
        Contact cont = new Contact();
        cont.FirstName = 'Test';
        cont.LastName = 'lastName';
        cont.Email = 'test@n26.com';
        cont.Home_Country__c = homeContId;
        return cont;
    }
    
    public static Home_Country_Relationship__c createRelationship(String contactId,String hCountId,String productId) {
        Home_Country_Relationship__c hcRelationship = new Home_Country_Relationship__c();
        hcRelationship.Contact__c = contactId;
		hcRelationship.Home_Country__c =  hCountId;
        hcRelationship.Product__c = productId;
        hcRelationship.Product_Type__c = 'Standard';
        hcRelationship.Amount__c = '1234';
        return hcRelationship;
    }
    
    public static List<Contact> createBulkContacts(Integer count) {
        List<Contact> contList = new List<Contact>();
        Contact contObj;
        for(Integer i=0;i<count;i++) {
            contObj = new Contact();
            contObj.FirstName = 'testFname'+i;
            contObj.LastName = 'Lname'+i;
            contObj.Email = 'test'+i+'@n26.com';
            contObj.survey_date__c = System.now()-2;
            contObj.Survey_Email_Sent__c = false;
            contList.add(contObj);
        }
        return contList;
    }

}