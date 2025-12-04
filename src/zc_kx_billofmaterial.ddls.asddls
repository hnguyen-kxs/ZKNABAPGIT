@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Bill of Material - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_BillOfMaterial
  as select from ZI_BillOfMaterial
{
  key BillOfMaterialCategory,
  key BillOfMaterial,
  key BillOfMaterialItemNodeNumber,
  key BillOfMaterialVariant,
  key Material,
  key Plant,
  key BillOfMaterialVariantUsage,

      ValidityStartDate,
      ValidityEndDate,
      EngineeringChangeDocument,
      ChgToEngineeringChgDocument,
      BillOfMaterialComponent,
      BillOfMaterialItemNumber,
      BillOfMaterialItemUnit,
      @Semantics.quantity.unitOfMeasure: 'BillOfMaterialItemUnit'
      BillOfMaterialItemQuantity,
      ComponentScrapInPercent,
      IsBulkMaterial,
      SpecialProcurementType,
      MaterialIsCoProduct,
      LeadTimeOffset,
      AlternativeItemGroup,
      AlternativeItemPriority,
      UsageProbabilityPercent,
      BOMHeaderBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BOMHeaderBaseUnit'
      BOMHeaderQuantityInBaseUnit,
      AlternativeUnit,
      QuantityNumerator,
      QuantityDenominator,
      SIUnitCnvrsnRateNumerator,
      SIUnitCnvrsnRateDenominator,
      BaseUnit,
      ProductionVersion,
      ProdVerValidityStartDate,
      ProdVerValidityEndDate,
      ProductionVersionIsLocked,
      MaterialProcurementProfile,
      MaterialBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MaterialMinLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MaterialMaxLotSizeQuantity
}
