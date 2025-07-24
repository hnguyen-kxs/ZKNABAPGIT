@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bill of Material Sales - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_BillOfMaterialSalesBOM
  as select from ZI_BillOfMaterialSalesBOM
{
  key BillOfMaterialCategory,
  key BillOfMaterial,
  key BillOfMaterialItemNodeNumber,
  key BillOfMaterialVariant,
  key Material,
  key Plant,
  key SalesDocument,
  key SalesDocumentItem,
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
      BOMHeaderQuantityInBaseUnit
}
