@AbapCatalog.sqlViewName: 'ZE2E001CSOI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'OData Demo Service - SalesOrder Items'
define view ZE2E001_C_SALESORDERITEM
  as select from ZE2E001_I_SalesOrderItem_E

  association [0..*] to SEPM_I_SalesOrderItemText_E as _Text on  $projection.SalesOrder     = _Text.SalesOrder
                                                             and $projection.SalesOrderItem = _Text.SalesOrderItem


{
     //ZE2E001_I_SalesOrderItem_E 
    key SalesOrder, 
     key SalesOrderItem, 
     Product, 
     TransactionCurrency, 
     @Semantics.amount.currencyCode: 'TransactionCurrency'
     GrossAmountInTransacCurrency, 
     @Semantics.amount.currencyCode: 'TransactionCurrency'
     NetAmountInTransactionCurrency, 
     @Semantics.amount.currencyCode: 'TransactionCurrency'
     TaxAmountInTransactionCurrency, 
     DeliveryDateTime,
     @Semantics.unitOfMeasure: true 
     QuantityUnit as Unit, 
     @Semantics.quantity.unitOfMeasure: 'Unit'
     Quantity, 
     /* Associations */ 
     //ZE2E001_I_SalesOrderItem_E 
     _Product, 
     _Text, 
     _TransactionCurrency 


} 
