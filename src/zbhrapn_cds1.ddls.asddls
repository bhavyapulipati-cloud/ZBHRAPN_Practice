@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '1st cds'
@Metadata.ignorePropagatedAnnotations: true
define view entity zbhrapn_cds1 as select from zbhrapn_dt_prod
{
    key prod_id as ProdId,
    descpt as Descpt,
//    @Semantics.amount.currencyCode: 'Currency'
    cast( price as abap.dec( 7, 2 ) ) as Price,
    currency as Currency,
   cast( ( cast( price as abap.fltp ) * 1.18 ) as abap.dec( 7, 2 ) ) as price_with_tax
}
