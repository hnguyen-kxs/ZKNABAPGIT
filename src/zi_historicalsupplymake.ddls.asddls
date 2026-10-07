@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Historical Supply Make - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_HistoricalSupplyMake
  with parameters
    p_days : int2
  as select from    I_ManufacturingOrder     as _Order
    inner join      I_ManufacturingOrderItem as _Item      on _Order.ManufacturingOrder = _Item.ManufacturingOrder
    left outer join I_ProductValuationBasic  as _Valuation on  _Order.BillOfOperationsMaterial = _Valuation.Product
                                                           and _Order.ProductionPlant          = _Valuation.ValuationArea
{
  key _Order.ManufacturingOrder                                as ManufacturingOrder, // aufnr
  key _Order.ManufacturingOrderItem                            as ManufacturingOrderItem, //posnr
      _Order.ManufacturingOrderType                            as ManufacturingOrderType, //auart
      _Order.Currency                                          as Currency, //waers
      _Order.ProductionPlant                                   as ProductionPlant, //werks
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _Item.MfgOrderItemGoodsReceiptQty                        as MfgOrderItemGoodsReceiptQty, //wemng
      cast(_Order.BillOfOperationsMaterial as abap.char(40))    as BillofOperationsMaterial, // plnbez
      _Order.MfgOrderScheduledEndDate                          as MfgOrderScheduledEndDate, // gstrs
      _Order.MfgOrderActualEndDate                             as MfgOrderActualEndDate,    // gltri
      _Order.ProductionUnit                                    as ProductionUnit, // gmein
       @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _Order.MfgOrderConfirmedYieldQty                         as MfgOrderConfirmedYieldQty, // igmng
       @Semantics.amount.currencyCode: 'Currency'
      _Valuation.StandardPrice                                 as StandardPrice, //stprs
      _Valuation.PriceUnitQty                                  as PriceUnitQty // peinh
}
where
      _Order.MfgOrderScheduledEndDate >=( dats_add_days(  $session.system_date, -$parameters.p_days, 'FAIL' ) )
  and _Item.ManufacturingOrderItem    = '0001'
