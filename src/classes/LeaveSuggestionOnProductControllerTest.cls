/********************************************************************
Name : LeaveSuggestionOnProductControllerTest
Author : Nikola Naumovski
Date    : 13.08.2017
Usage   : This class is used as a Test class for LeaveSuggestionOnProductController
*********************************************************************/
@isTest
public class LeaveSuggestionOnProductControllerTest
{
    @testSetup
    private static void loadTestData()
    {
        Product2 prod = UtilsCreateStandardObjectTest.createProduct2('BOSCH Fuel pump');
    }

    static testMethod void getCommunityProductFeedbackTest()
    {
        Product2 prod = [SELECT Id FROM Product2 WHERE Name = 'BOSCH Fuel pump'];
        String description = 'Test description';
        Test.startTest();
        Product_Feedback__c productFeedback = LeaveSuggestionOnProductController.getCommunityProductFeedback(prod.Id,description);
        Test.stopTest();
        Product_Feedback__c queriedProductFeedback = [SELECT Id FROM Product_Feedback__c WHERE Name = 'BOSCH Fuel pump' LIMIT 1];
        System.assertEquals(productFeedback.Id,queriedProductFeedback.Id, 'Product has been successsfully inserted!');
    }

    static testMethod void getCommunityProductFeedbackWithEmptyDescriptionTest()
    {
        Product2 prod = [SELECT Id FROM Product2 WHERE Name = 'BOSCH Fuel pump' LIMIT 1];
        String description = '';
        Test.startTest();
        Product_Feedback__c productFeedback = LeaveSuggestionOnProductController.getCommunityProductFeedback(prod.Id,description);
        Test.stopTest();
        System.assertEquals(null,productFeedback, 'Product has not been successsfully inserted!');
    }
}