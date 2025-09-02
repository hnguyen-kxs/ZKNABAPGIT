@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'InfoRecord PartSource - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION

define view entity ZC_KX_InfoRecordPartSource
  as select from ZI_InfoRecordPartSource
{
  key PurchasingInfoRecord,
  key PurchasingOrganization,
  key PurchasingInfoRecordCategory,
  key Plant,
      IsMarkedForDeletion,
      PurchasingGroup,
      Currency,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderPriceUnit'
      MinimumPurchaseOrderQuantity,
      MaterialPlannedDeliveryDurn,
      @Semantics.amount.currencyCode: 'Currency'
      NetPriceAmount,
      MaterialPriceUnitQty,
      PurchaseOrderPriceUnit,
      PriceValidityEndDate,
      OrderPriceUnitToOrderUnitNmrtr,
      OrdPriceUnitToOrderUnitDnmntr,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderPriceUnit'
      MaximumOrderQuantity,
      IsRelevantForAutomSrcg,
      ShippingInstruction,
      Supplier,
      Material,
      PurgDocOrderQuantityUnit,
      SupplierMaterialNumber,
      BaseUnit,
      IsDeleted,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      FixedLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      MaximumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      MinimumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      LotSizeRoundingQuantity,
      LotSizingProcedure,
      PlanningTimeFence,
      ProcurementType,
      ProcurementSubType,
      AssemblyScrapPercent,
      GoodsReceiptDuration,
      ProdInhProdnDurationInWorkDays,
      PlannedDeliveryDurationInDays,
      FactoryCalendar,
      @Semantics.amount.currencyCode: 'Currency'
      StandardPrice,
      PriceUnitQty,
      SupplierName,
      SupplyingOrProductionPlant
}
