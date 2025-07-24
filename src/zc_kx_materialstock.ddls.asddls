@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'MaterialStock - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_MaterialStock
  as select from ZI_MaterialStock
{
  key Material,
  key Plant,
  key StorageLocation,
  key Batch,
  key Supplier,
  key SDDocument,
  key SDDocumentItem,
  key WBSElementInternalID,
  key Customer,
  key SpecialStockIdfgStockOwner,
  key InventoryStockType,
  key InventorySpecialStockType,
      MaterialBaseUnit,
      StorageLocationName,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MatlWrhsStkQtyInMatlBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MatlCnsmpnQtyInMatlBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MatlStkIncrQtyInMatlBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MatlStkDecrQtyInMatlBaseUnit
}
