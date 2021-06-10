@AbapCatalog.sqlViewName: 'ZIFETRVANA000004'
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel view entity for booking analysis'
@Metadata.allowExtensions: true
define view ZI_FE_TRAVEL_ANALYTICS_000004
  as select from zfe_atrav_000004 as Travel
  association [0..1] to /DMO/I_Agency as _Agency on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
{
  key TRAVEL_UUID as TravelUUID,
  
  TRAVEL_ID as TravelID,
  
  AGENCY_ID as AgencyID,
  
  CUSTOMER_ID as CustomerID,
  
  BEGIN_DATE as BeginDate,
  
  END_DATE as EndDate,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  BOOKING_FEE as BookingFee,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  TOTAL_PRICE as TotalPrice,
  
  CURRENCY_CODE as CurrencyCode,
  
  DESCRIPTION as Description,
  
  OVERALL_STATUS as OverallStatus,
  
  @Semantics.user.createdBy: true
  CREATED_BY as CreatedBy,
  
  @Semantics.systemDateTime.createdAt: true
  CREATED_AT as CreatedAt,
  
  @Semantics.user.lastChangedBy: true
  LAST_CHANGED_BY as LastChangedBy,
  
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LAST_CHANGED_AT,
  
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  
  _Agency,
  
  _Customer
}
