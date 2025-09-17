@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ProductionOrder - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_ProductionOrders
  as select from    I_ManufacturingOrder       as _ProdOrd
    inner join      I_ManufacturingOrderItem   as _ProdItem on  _ProdOrd.ManufacturingOrder     = _ProdItem.ManufacturingOrder
                                                            and _ProdOrd.ManufacturingOrderItem = _ProdItem.ManufacturingOrderItem
    left outer join I_ManufacturingOrderStatus as _Status   on _ProdOrd.ObjectInternalID = _Status.StatusObject
                                                            and(
                                                              _Status.StatusCode         = 'I0045'
                                                              or _Status.StatusCode      = 'I0046'
                                                              or _Status.StatusCode      = 'I0012'
                                                              or _Status.StatusCode      = 'I0076'
                                                            )

{
  key _ProdOrd.ManufacturingOrder              as ManufacturingOrder,
      _ProdOrd.ManufacturingOrderItem          as ManufacturingOrderItem,
      _ProdOrd.ManufacturingOrderCategory      as ManufacturingOrderCategory,
      _ProdOrd.ManufacturingOrderType          as ManufacturingOrderType,
      cast(_ProdOrd.Material as abap.char(40)) as Material,
      _ProdOrd.MaterialGoodsReceiptDuration    as MaterialGoodsReceiptDuration,
      _ProdOrd.Currency                        as Currency,
      _ProdOrd.ProductionPlant                 as ProductionPlant,
      _ProdOrd.PlanningPlant                   as PlanningPlant,
      _ProdOrd.MRPArea                         as MRPArea,
      _ProdOrd.SalesOrder                      as SalesOrder,
      _ProdOrd.SalesOrderItem                  as SalesOrderItem,
      _ProdOrd.Reservation                     as Reservation,
      _ProdOrd.BillOfOperationsMaterial        as BillOfOperationsMaterial,
      _ProdOrd.BillOfOperationsType            as BillOfOperationsType,
      _ProdOrd.BillOfOperations                as BillOfOperations,
      _ProdOrd.BillOfOperationsVariant         as BillOfOperationsVariant,
      _ProdOrd.MfgOrderPlannedStartDate        as MfgOrderPlannedStartDate,
      _ProdOrd.MfgOrderPlannedEndDate          as MfgOrderPlannedEndDate,
      _ProdOrd. MfgOrderScheduledStartDate     as MfgOrderScheduledStartDate,
      _ProdOrd. MfgOrderScheduledEndDate       as MfgOrderScheduledEndDate,
      _ProdOrd.MfgOrderActualStartDate         as MfgOrderActualStartDate,
      _ProdOrd.MfgOrderConfirmedEndDate        as MfgOrderConfirmedEndDate,
      _ProdOrd.MfgOrderActualEndDate           as MfgOrderActualEndDate,
      _ProdOrd.ProductionUnit                  as ProductionUnit,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _ProdOrd.MfgOrderPlannedTotalQty         as MfgOrderPlannedTotalQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _ProdOrd. MfgOrderConfirmedYieldQty      as MfgOrderConfirmedYieldQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _ProdOrd.ActualDeliveredQuantity         as ActualDeliveredQuantity,

      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _ProdItem.MfgOrderItemPlannedTotalQty    as MfgOrderItemPlannedTotalQty
}
where
      _Status.StatusObject              is null
  and _ProdOrd.IsMarkedForDeletion      =  ''
  and _ProdOrd.MfgOrderPlannedEndDate   != '00000000'
  and _ProdOrd.MfgOrderPlannedTotalQty  >  0
  and _ProdOrd.BillOfOperationsMaterial != ''
