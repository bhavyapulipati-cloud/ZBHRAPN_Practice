@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZZZBHRAPN_DT_CUST'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZZZC_BHRAPN_DT_CUST
  provider contract TRANSACTIONAL_QUERY
  as projection on ZZZR_BHRAPN_DT_CUST
  association [1..1] to ZZZR_BHRAPN_DT_CUST as _BaseEntity on $projection.CUSTID = _BaseEntity.CUSTID
{
  key CustID,
  Name,
  CompName,
  Cntry,
  City,
  Mobile,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  Lastchangedtimestmp,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  Creationtimestmp,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  Lastchangeduser,
  @Semantics: {
    User.Createdby: true
  }
  Creationuser,
  _BaseEntity
}
