@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'T001W view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZKN_T001W
  as select from t001w
{
  key t001w.werks                       as Werks,
      t001w.name1                       as Name1,
      t001w.bwkey                       as Bwkey,
      t001w.kunnr                       as Kunnr,
      t001w.lifnr                       as Lifnr,
      t001w.fabkl                       as Fabkl,
      t001w.name2                       as Name2,
      t001w.stras                       as Stras,
      t001w.pfach                       as Pfach,
      t001w.pstlz                       as Pstlz,
      t001w.ort01                       as Ort01,
      t001w.ekorg                       as Ekorg,
      t001w.vkorg                       as Vkorg,
      t001w.chazv                       as Chazv,
      t001w.kkowk                       as Kkowk,
      t001w.kordb                       as Kordb,
      t001w.bedpl                       as Bedpl,
      t001w.land1                       as Land1,
      t001w.regio                       as Regio,
      t001w.counc                       as Counc,
      t001w.cityc                       as Cityc,
      t001w.adrnr                       as Adrnr,
      t001w.iwerk                       as Iwerk,
      t001w.txjcd                       as Txjcd,
      t001w.vtweg                       as Vtweg,
      t001w.spart                       as Spart,
      t001w.spras                       as Spras,
      t001w.wksop                       as Wksop,
      t001w.awsls                       as Awsls,
      t001w.chazv_old                   as ChazvOld,
      t001w.vlfkz                       as Vlfkz,
      t001w.bzirk                       as Bzirk,
      t001w.zone1                       as Zone1,
      t001w.taxiw                       as Taxiw,
      t001w.bzqhl                       as Bzqhl,
      t001w.let01                       as Let01,
      t001w.let02                       as Let02,
      t001w.let03                       as Let03,
      t001w.txnam_ma1                   as TxnamMa1,
      t001w.txnam_ma2                   as TxnamMa2,
      t001w.txnam_ma3                   as TxnamMa3,
      t001w.betol                       as Betol,
      t001w.j_1bbranch                  as J1bbranch,
      t001w.vtbfi                       as Vtbfi,
      t001w.fprfw                       as Fprfw,
      t001w.achvm                       as Achvm,
      t001w.dvsart                      as Dvsart,
      t001w.nodetype                    as Nodetype,
      t001w.nschema                     as Nschema,
      t001w.pkosa                       as Pkosa,
      t001w.misch                       as Misch,
      t001w.mgvupd                      as Mgvupd,
      t001w.vstel                       as Vstel,
      t001w.mgvlaupd                    as Mgvlaupd,
      t001w.mgvlareval                  as Mgvlareval,
      t001w.sourcing                    as Sourcing,
      t001w.no_default_batch_management as NoDefaultBatchManagement,
      t001w.fsh_mg_arun_req             as FshMgArunReq,
      t001w.fsh_seaim                   as FshSeaim,
      t001w.fsh_bom_maintenance         as FshBomMaintenance,
      t001w.fsh_group_pr                as FshGroupPr,
      t001w.arun_fix_batch              as ArunFixBatch,
      t001w.oilival                     as Oilival,
      t001w.oihvtype                    as Oihvtype,
      t001w.oihcredipi                  as Oihcredipi,
      t001w.storetype                   as Storetype,
      t001w.dep_store                   as DepStore
}
