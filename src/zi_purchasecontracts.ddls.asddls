@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Purchase Contracts View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_PurchaseContracts
  as select from    I_PurchaseContractAPI01      as _Contr
    inner join      I_PurchaseContractItemAPI01  as _Item    on _Contr.PurchaseContract = _Item.PurchaseContract
    inner join      I_ProductPlantSupplyPlanning as _SupPlan on  _Item.Material = _SupPlan.Product
                                                             and _Item.Plant    = _SupPlan.Plant
    inner join      I_Plant                      as _Plant   on _Item.Plant = _Plant.Plant
    left outer join I_ProductValuationBasic      as _Val     on  _Item.Material     = _Val.Product
                                                             and _Item.Plant        = _Val.ValuationArea
                                                             and _Val.ValuationType = ''
    left outer join I_Supplier                   as _Suppl   on _Contr.Supplier = _Suppl.Supplier

{
  key _Contr.PurchaseContract                as PurchaseContract,
  key _Item.PurchaseContractItem             as PurchaseContractItem,
      _Contr.PurchaseContractType            as PurchaseContractType,
      _Contr.PurchasingDocumentCategory      as PurchasingDocumentCategory,
      _Contr.Supplier                        as Supplier,
      _Contr.PurchasingOrganization          as PurchasingOrganization,
      _Contr.DocumentCurrency                as DocumentCurrency,
      _Contr.ValidityStartDate               as ValidityStartDate,
      _Contr.ValidityEndDate                 as ValidityEndDate,
      _Contr.ReleaseCode                     as ReleaseCode,
      _Contr.PurchasingDocumentDeletionCode  as PurchasingDocumentDeletionCode,
      _Contr.SupplyingSupplier               as SupplyingSupplier,
      _Contr.PurchasingDocumentOrigin        as PurchasingDocumentOrigin,

      cast(_Item.Material as abap.char(40))  as Material,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _Item.ContractNetPriceAmount           as ContractNetPriceAmount,

      _Item.OrderPriceUnit                   as OrderPriceUnit,
      _Item.OrderQuantityUnit                as OrderQuantityUnit,
      _Item.Subcontractor                    as Subcontractor,
      _Item.Plant                            as Plant,
      _Item.StorageLocation                  as StorageLocation,
      _Item.AccountAssignmentCategory        as AccountAssignmentCategory,
      @Semantics.quantity.unitOfMeasure: 'OrderPriceUnit'
      _Item.NetPriceQuantity                 as NetPriceQuantity,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _Item.TargetQuantity                   as TargetQuantity,
      _Item.OrdPriceUnitToOrderUnitDnmntr    as OrdPriceUnitToOrderUnitDnmntr,
      _Item.OrderPriceUnitToOrderUnitNmrtr   as OrderPriceUnitToOrderUnitNmrtr,
      _Item.PurchasingDocumentItemCategory   as PurchasingDocumentItemCategory,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _Item.PurgDocReleaseOrderQuantity      as PurgDocReleaseOrderQuantity,
      _Item.StockType                        as StockType,
      _Item.RequirementTracking              as RequirementTracking,
      _Item.PlannedDeliveryDurationInDays    as PlannedDeliveryDurationInDays,
      _Item.PurchasingInfoRecord             as PurchasingInfoRecord,

      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.FixedLotSizeQuantity          as FixedLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.MaximumLotSizeQuantity        as MaximumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.MinimumLotSizeQuantity        as MinimumLotSizeQuantity,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _SupPlan.LotSizeRoundingQuantity       as LotSizeRoundingQuantity,
      _SupPlan.BaseUnit                      as BaseUnit,
      _SupPlan.LotSizingProcedure            as LotSizingProcedure,
      _SupPlan.PlanningTimeFence             as PlanningTimeFence,
      _SupPlan.PlannedDeliveryDurationInDays as PlannedDelDurationInDaysPlan,
      _SupPlan.ProcurementType               as ProcurementType,
      _SupPlan.ProcurementSubType            as ProcurementSubType,
      _SupPlan.AssemblyScrapPercent          as AssemblyScrapPercent,
      _SupPlan.GoodsReceiptDuration          as GoodsReceiptDuration,

      _Plant.FactoryCalendar                 as FactoryCalendar,

      @Semantics.amount.currencyCode: 'Currency'
      _Val.StandardPrice                     as StandardPrice,
      _Val.Currency                          as Currency,
      _Val.PriceUnitQty                      as PriceUnitQty,

      _Suppl.SupplierName                    as SupplierName
}
where
      _Contr.ValidityEndDate                >= $session.system_date
  and _Contr.PurchasingDocumentDeletionCode =  ''
  and _Item.Material                        <> ''
  and _Suppl.IsBusinessPurposeCompleted = ''                            //Personal Data Protection filter
