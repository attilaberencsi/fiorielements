@AbapCatalog.sqlViewName: 'zifeflig000004'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight view entity'
@Search.searchable: true
define view ZI_FE_FLIG_000004
  as select from zfe_aflig_000004 as Flight
  association [1] to zi_fe_carr_000004 as _Airline on $projection.AirlineID = _Airline.AirlineID
  association [1] to zi_fe_conn_000004 as _Connection on $projection.ConnectionID = _Connection.ConnectionID and $projection.AirlineID = _Connection.AirlineID
  association [0..1] to I_Currency as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.8 
  @ObjectModel.text.association: '_Airline'
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'zi_fe_carr_000004', 
      element: 'AirlineID'
    }
  } ]
  key Flight.carrier_id as AirlineID,
  
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.8 
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'zi_fe_conn_000004', 
      element: 'ConnectionID'
    }, 
    additionalBinding: [ {
      element: 'AirlineID', 
      localElement: 'AirlineID'
    } ]
  } ]
  key Flight.connection_id as ConnectionID,
  
  key Flight.flight_date as FlightDate,
  
  @Semantics.amount.currencyCode: 'CurrencyCode'
  Flight.price as Price,
  
  @Semantics.currencyCode: true
  Flight.currency_code as CurrencyCode,
  
  Flight.plane_type_id as PlaneType,
  
  Flight.seats_max as MaximumSeats,
  
  Flight.seats_occupied as OccupiedSeats,
  
  _Airline,
  
  _Connection,
  
  _Currency
}
