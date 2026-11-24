@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2nd cds assignment'
@Metadata.ignorePropagatedAnnotations: true
define view entity zbhrapn_cds2
  as select from zbhrapn_dt_cust  as cust
    inner join   zbhrapn_dt_sohd  as sohd  on cust.cust_id = sohd.buyer
    inner join   zbhrapn_dt_soitm as soitm on sohd.soid = soitm.soid
{
//  key sohd.soid                                     as SOHDR,
      cust.cust_id                                  as Customer,
      count( distinct sohd.soid )                   as tot_sales,
      //    cast(soitm.amt as abap.dec( 7, 2 ) ) as soItmamt,
      cast( sum( soitm.amt  ) as abap.dec( 7, 2 ) ) as tot_itm_amts
}
group by
  cust.cust_id
//  sohd.soid
