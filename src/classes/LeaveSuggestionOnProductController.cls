/********************************************************************
Name : LeaveSuggestionOnProductController
Author : Nikola Naumovski
Date    : 13.08.2017
Usage   : getCommunityProductFeedback is called by LeaveSuggestionOnProductHelper.js and its used to insert Product_Feedback__c
*********************************************************************/

public with sharing class LeaveSuggestionOnProductController
{
    @AuraEnabled
    public static Product_Feedback__c getCommunityProductFeedback(String recordId, String description) 
    {
        Product_Feedback__c productFeedback;
        try
        {
            User currentUser = [SELECT Account.Name FROM User WHERE Id =: UserInfo.getUserId()];
            Product2 product = [SELECT Name FROM Product2 WHERE Id = :recordId];
            productFeedback = new Product_Feedback__c(
                Name = product.Name,
                Account_Name__c = currentUser.Account.Name,
                Comment_Body__c = description);
            insert productFeedback;
        }
        catch(Exception e)
        {
            System.debug('LeaveSuggestionOnProductController.getCommunityProductFeedback ' + e.getMessage());
        }
        return productFeedback;
    }
}