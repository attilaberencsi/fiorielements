@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forTravel'
define root view entity ZI_FE_TRAVEL_000004
  as select from zfe_atrav_000004
  association [0..1] to /DMO/I_Agency        as _Agency       on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to I_Currency           as _Currency     on $projection.CurrencyCode = _Currency.Currency
  association [0..1] to /DMO/I_Customer      as _Customer     on $projection.CustomerID = _Customer.CustomerID
  association [0..1] to ZI_FE_STAT_000004    as _TravelStatus on $projection.OverallStatus = _TravelStatus.TravelStatusId
  composition [0..*] of ZI_FE_BOOKING_000004 as _Booking
{
  key travel_uuid           as TravelUUID,

      travel_id             as TravelID,

      agency_id             as AgencyID,

      customer_id           as CustomerID,

      begin_date            as BeginDate,

      end_date              as EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,

      currency_code         as CurrencyCode,

      description           as Description,

      overall_status        as OverallStatus,
      case overall_status
        when 'O'  then 2    -- 'open'       | 2: yellow colour
        when 'A'  then 3    -- 'accepted'   | 3: green colour
        when 'X'  then 1    -- 'rejected'   | 1: red colour
                  else 0    -- 'nothing'    | 0: unknown
      end                   as OverallStatusCriticality,


      @Semantics.user.createdBy: true
      created_by            as CreatedBy,

      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,

      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Booking,

      _Agency,

      _Currency,

      _Customer,

      _TravelStatus
}
