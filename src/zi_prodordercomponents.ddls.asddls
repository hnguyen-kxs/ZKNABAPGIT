@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ProdOrderComponents - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_ProdOrderComponents
  as select from I_MfgOrderComponentWithStatus as _Comp
    inner join   I_ManufacturingOrderItem      as _Item on _Comp.ManufacturingOrder = _Item.ManufacturingOrder
{
  key _Comp.Reservation                  as Reservation,
  key _Comp.ReservationItem              as ReservationItem,
  key _Comp.ReservationRecordType        as ReservationRecordType,
  key _Item.ManufacturingOrder           as ManufacturingOrder,
      _Comp.Material                     as ReservationMaterial,
      _Comp.Plant                        as Plant,
      _Comp.ManufacturingOrderType       as ManufacturingOrderType,

      _Comp.MatlCompRequirementDate      as MatlCompRequirementDate,
      _Comp.RequirementType              as RequirementType,
      _Comp.BOMExplosionDateID           as BOMExplosionDateID,
      _Comp.Assembly                     as Assembly,
      _Comp.BaseUnit                     as BaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Comp.RequiredQuantity             as RequiredQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Comp.WithdrawnQuantity            as WithdrawnQuantity,
      _Comp.StorageLocation              as StorageLocation,

      _Item.Material                     as Material,
      _Item.MaterialGoodsReceiptDuration as MaterialGoodsReceiptDuration,
      _Item.ProductionUnit               as ProductionUnit,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _Item.MfgOrderItemPlannedTotalQty  as MfgOrderItemPlannedTotalQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      _Item.MfgOrderItemGoodsReceiptQty  as MfgOrderItemGoodsReceiptQty,
      _Item._MRPPlant.Plant              as MRPPlant
}
where
      _Item.IsMarkedForDeletion     =  ''
  and _Item.MfgOrderPlannedTotalQty >  0
  and _Item.MfgOrderPlannedEndDate  != '00000000'
