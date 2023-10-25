@AbapCatalog.sqlViewName: 'ZIFK_000V_1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Homework Example'
define view ZIFK_000_CDS_HW
  as select from    ekko
    inner join      ekpo on ekpo.ebeln = ekko.ebeln
    inner join      mara on mara.matnr = mara.matnr
    inner join      lfa1 on lfa1.lifnr = ekko.lifnr
    left outer join makt on  makt.matnr = mara.matnr
                         and makt.spras = $session.system_language

{
  ekpo.ebeln,
  ekpo.ebelp,
  ekpo.matnr,
  makt.maktx,
  ekpo.werks,
  ekpo.lgort,
  ekpo.meins,
  lfa1.lifnr,
  lfa1.name1,
  concat_with_space( lfa1.stras, lfa1.mcod3, 1 ) as satici_adresi
}
