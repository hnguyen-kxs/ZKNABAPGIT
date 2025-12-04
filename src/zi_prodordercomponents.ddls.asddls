@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Production Order Components View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_ProdOrderComponents
  as select from I_MfgOrderComponentWithStatus as _Comp
    inner join   I_ManufacturingOrderItem      as _Item on _Comp.ManufacturingOrder = _Item.ManufacturingOrder
{
  key _Comp.Reservation                     as Reservation,
  key _Comp.ReservationItem                 as ReservationItem,
  key _Comp.ReservationRecordType           as ReservationRecordType,
  key _Item.ManufacturingOrder              as ManufacturingOrder,
  key _Item.ManufacturingOrderItem          as ManufacturingOrderItem,
      cast(_Comp.Material as abap.char(40)) as ReservationMaterial,
      _Comp.Plant                           as Plant,
      _Comp.ManufacturingOrderType          as ManufacturingOrderType,

      _Comp.MatlCompRequirementDate         as MatlCompRequirementDate,
      _Comp.RequirementType                 as RequirementType,
      _Comp.BOMExplosionDateID              as BOMExplosionDateID,
      cast(_Comp.Assembly as abap.char(40)) as Assembly,
      _Comp.BaseUnit                        as BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Comp.RequiredQuantity                as RequiredQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Comp.WithdrawnQuantity               as WithdrawnQuantity,
      _Comp.StorageLocation                 as StorageLocation,

      cast(_Item.Material as abap.char(40)) as Material,
      _Item.MaterialGoodsReceiptDuration    as MaterialGoodsReceiptDuration,
      _Item.ProductionUnit                  as ProductionUnit,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _Item.MfgOrderItemPlannedTotalQty     as MfgOrderItemPlannedTotalQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _Item.MfgOrderItemGoodsReceiptQty     as MfgOrderItemGoodsReceiptQty,
      _Item._MRPPlant.Plant                 as MRPPlant
}
where
      _Item.IsMarkedForDeletion     =  ''
  and _Item.MfgOrderPlannedTotalQty >  0
  and _Item.MfgOrderPlannedEndDate  != '00000000'
