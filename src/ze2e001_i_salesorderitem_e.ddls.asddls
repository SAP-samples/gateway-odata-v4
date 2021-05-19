@AbapCatalog.sqlViewName: 'ZE2E001_ISOIE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'OData Demo Service - SalesOrderItem'
define view ZE2E001_I_SalesOrderItem_E
as select from SEPM_I_SalesOrderItem_E as Item
  left outer join SEPM_I_SlsOrdItemSchedLine_E  as Scheduline
    on  Scheduline.SalesOrder = Item.SalesOrder
    and Scheduline.SalesOrderItem = Item.SalesOrderItem
    and Scheduline.ScheduleLine = '0001' 
{
//Item 
Item.SalesOrder, 
Item.SalesOrderItem, 
Product, 
TransactionCurrency, 
GrossAmountInTransacCurrency, 
NetAmountInTransactionCurrency, 
TaxAmountInTransactionCurrency, 
//Scheduline 
Scheduline.DeliveryDateTime as DeliveryDateTime, 
Scheduline.QuantityUnit , 
Scheduline.Quantity as Quantity, 
/* Associations */ 
//Item 
_Product,  
Item._SalesOrder, 
_Text, 
_TransactionCurrency
//Scheduline 

} 
