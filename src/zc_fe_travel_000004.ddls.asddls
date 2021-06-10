@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@Search.searchable: true
define root view entity ZC_FE_TRAVEL_000004
  as projection on ZI_FE_Travel_000004
{
  key TravelUUID,
  
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.90 
  TravelID,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: '/DMO/I_Agency', 
      element: 'AgencyID'
    }
  } ]
  AgencyID,
  
  CustomerID,
  
  BeginDate,
  
  EndDate,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  BookingFee,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  TotalPrice,
  
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }
  } ]
  CurrencyCode,
  
  Description,
  
  OverallStatus,
  
  CreatedBy,
  
  CreatedAt,
  
  LastChangedBy,
  
  LastChangedAt,
  
  LocalLastChangedAt,
  
  _Booking : redirected to composition child ZC_FE_Booking_000004,
  
  _Agency,
  
  _Currency,
  
  _Customer,
  
  _TravelStatus
}
