@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_MaterialStock
  as select from    I_MaterialStock   as _MatStock
    left outer join I_StorageLocation as _StrLoc on _MatStock.StorageLocation = _StrLoc.StorageLocation
{
  key _MatStock.Material                          as Material,
  key _MatStock.Plant                             as Plant,
  key _MatStock.StorageLocation                   as StorageLocation,
  key _MatStock.Batch                             as Batch,
  key _MatStock.Supplier                          as Supplier,
  key _MatStock.SDDocument                        as SDDocument,
  key _MatStock.SDDocumentItem                    as SDDocumentItem,
  key _MatStock.WBSElementInternalID              as WBSElementInternalID,
  key _MatStock.Customer                          as Customer,
  key _MatStock.SpecialStockIdfgStockOwner        as SpecialStockIdfgStockOwner,
  key _MatStock.InventoryStockType                as InventoryStockType,
  key _MatStock.InventorySpecialStockType         as InventorySpecialStockType,
      _MatStock.MaterialBaseUnit                  as MaterialBaseUnit,
      _StrLoc.StorageLocationName                 as StorageLocationName,

      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      @DefaultAggregation : #SUM
      sum(_MatStock.MatlWrhsStkQtyInMatlBaseUnit) as MatlWrhsStkQtyInMatlBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      @DefaultAggregation : #SUM
      sum(_MatStock.MatlCnsmpnQtyInMatlBaseUnit)  as MatlCnsmpnQtyInMatlBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      @DefaultAggregation : #SUM
      sum(_MatStock.MatlStkIncrQtyInMatlBaseUnit) as MatlStkIncrQtyInMatlBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      @DefaultAggregation : #SUM
      sum(_MatStock.MatlStkDecrQtyInMatlBaseUnit) as MatlStkDecrQtyInMatlBaseUnit
}
where
  _MatStock.MatlWrhsStkQtyInMatlBaseUnit <> 0
group by
  _MatStock.Material,
  _MatStock.Plant,
  _MatStock.StorageLocation,
  _MatStock.Batch,
  _MatStock.Supplier,
  _MatStock.SDDocument,
  _MatStock.SDDocumentItem,
  _MatStock.WBSElementInternalID,
  _MatStock.Customer,
  _MatStock.SpecialStockIdfgStockOwner,
  _MatStock.InventoryStockType,
  _MatStock.InventorySpecialStockType,
  _MatStock.MaterialBaseUnit,
  _StrLoc.StorageLocationName
