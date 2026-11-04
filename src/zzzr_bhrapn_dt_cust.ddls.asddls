@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZZZBHRAPN_DT_CUST'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZZZR_BHRAPN_DT_CUST
  as select from ZBHRAPN_DT_CUST
{
  key cust_id as CustID,
  name as Name,
  comp_name as CompName,
  cntry as Cntry,
  city as City,
  mobile as Mobile,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedtimestmp as Lastchangedtimestmp,
  @Semantics.systemDateTime.createdAt: true
  creationtimestmp as Creationtimestmp,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangeduser as Lastchangeduser,
  @Semantics.user.createdBy: true
  creationuser as Creationuser
}
