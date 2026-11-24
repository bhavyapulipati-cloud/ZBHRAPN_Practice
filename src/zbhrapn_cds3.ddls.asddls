@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unions'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBHRAPN_CDS3 as select from zbhrapn_dt_soitm
{
   key soid as Soid,
   key item_id as ItemId,
   prod as Prod,
   @Semantics.amount.currencyCode: 'Curr'
   amt as Amt,
   curr as Curr
} where amt > 150
union all
select from zbhrapn_dt_soitm
{
   key soid as Soid,
   key item_id as ItemId,
   prod as Prod,   
   amt as Amt,
   curr as Curr
} where amt > 200
