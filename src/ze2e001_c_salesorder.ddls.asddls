@AbapCatalog.sqlViewName: 'ZE2E001CSO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'OData Demo Service - SalesOrder Root'
define view ZE2E001_C_SalesOrder
  as select from SEPM_I_SalesOrder_E

  association [1..*] to ZE2E001_C_SALESORDERITEM as _Item on _Item.SalesOrder = $projection.SalesOrder
  association [0..*] to SEPM_I_SalesOrderText_E  as _Text on $projection.SalesOrder = _Text.SalesOrder


{
      //SEPM_I_SalesOrder_E
  key SalesOrder,
      CreatedByUser,
      CreationDateTime,
      LastChangedByUser,
      LastChangedDateTime,
      IsCreatedByBusinessPartner,
      IsLastChangedByBusinessPartner,
      Customer,
      _Customer.CompanyName as CompanyName,
      CustomerContact,
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      GrossAmountInTransacCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmountInTransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TaxAmountInTransactionCurrency,
      SalesOrderLifeCycleStatus,
      SalesOrderBillingStatus,
      SalesOrderDeliveryStatus,
      SalesOrderOverallStatus,
      Opportunity,
      SalesOrderPaymentMethod,
      SalesOrderPaymentTerms,
      BillToParty,
      BillToPartyRole,
      ShipToParty,
      ShipToPartyRole,
      /* Associations */
      //SEPM_I_SalesOrder_E
      //  _BillingStatus,
      //  _BillToParty,
      //  _BillToPartyRole,
      //  _CreatedByUser,
      //  _Customer,
      //  _CustomerContact,
      //  _CustomerV2,
      //  _DeliveryStatus,
      _Item,
      //  _ItemV2,
      //  _LastChangedByUser,
      //  _LifeCycleStatus,
      //  _OverallStatus,
      //  _PaymentMethod,
      //  _PaymentTerms,
      //  _ShipToParty,
      //  _ShipToPartyRole,
      _Text
      //  _TransactionCurrency
}
