/********************************************************************
Name : UtilsCreateStandardObjectTest
Author : Nikola Naumovski
Date    : 13.08.2017
Usage   : This is a helper class used to create standard SObjects
*********************************************************************/

@isTest
public class UtilsCreateStandardObjectTest
{
    public static Product2 createProduct2(String productName)
    {
        Product2 p2 = new Product2( Name = productName,IsActive = true);
        insert p2;
        return p2;
    }
    
}