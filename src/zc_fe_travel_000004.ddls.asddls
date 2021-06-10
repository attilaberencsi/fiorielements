@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@Search.searchable: true
@ObjectModel:{
  semanticKey: ['TravelID']
}
define root view entity ZC_FE_TRAVEL_000004
  as projection on ZI_FE_TRAVEL_000004
{
  key TravelUUID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @EndUserText.label: 'Travel'
      @ObjectModel.text.element: ['Description']
      TravelID,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element: 'AgencyID'
        }
      } ]

      @EndUserText.label: 'Agency'
      @ObjectModel.text.element: ['AgencyName']
      AgencyID,
      _Agency.Name                   as AgencyName,

      @EndUserText.label: 'Customer'
      @ObjectModel.text.element: ['LastName']
      @Consumption.valueHelpDefinition: [{
        entity :{
          name: '/DMO/I_Customer',
          element: 'CustomerID'
        }
      }]
      CustomerID,
      _Customer.LastName             as LastName,

      @EndUserText.label: 'Start Date'
      BeginDate,

      @EndUserText.label: 'End Date'
      EndDate,

      @EndUserText.label: 'Booking Fee'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @EndUserText.label: 'Total Price'
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

      @EndUserText.label: 'Status'
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'ZI_FE_STAT_000004',
          element: 'TravelStatusId'
        }
      } ]
      @ObjectModel.text.element: ['StatusText']
      OverallStatus,
      _TravelStatus.TravelStatusText as StatusText,
      
      OverallStatusCriticality,
                  
      CreatedBy,

      CreatedAt,

      LastChangedBy,

      LastChangedAt,

      @EndUserText.label: 'Last Change'
      LocalLastChangedAt,

      _Booking : redirected to composition child ZC_FE_BOOKING_000004,

      _Agency,

      _Currency,

      _Customer,

      _TravelStatus
}
