@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Scheduling Agreements'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_SchedulingAgreements
  as select from    I_SchedgagrmthdrApi01        as _Sched
    inner join      I_SchedgAgrmtItmApi01        as _Item    on _Sched.SchedulingAgreement = _Item.SchedulingAgreement
    inner join      I_ProductPlantSupplyPlanning as _SupPlan on  _Item.Material = _SupPlan.Product
                                                             and _Item.Plant    = _SupPlan.Plant
    inner join      I_Plant                      as _Plant   on _Item.Plant = _Plant.Plant
    left outer join I_ProductValuationBasic      as _Val     on  _Item.Material     = _Val.Product
                                                             and _Item.Plant        = _Val.ValuationArea
                                                             and _Val.ValuationType = ''

    left outer join I_Supplier                   as _Suppl   on _Sched.Supplier = _Suppl.Supplier
{
  key _Sched.SchedulingAgreement             as SchedulingAgreement,
      _Sched.PurchasingDocumentCategory      as PurchasingDocumentCategory,
      _Sched.PurchasingDocumentType          as PurchasingDocumentType,
      _Sched.PurchasingOrganization          as PurchasingOrganization,
      _Sched.DocumentCurrency                as DocumentCurrency,
      _Sched.PurchasingDocumentOrderDate     as PurchasingDocumentOrderDate,
      _Sched.Supplier                        as Supplier,
      _Sched.ValidityStartDate               as ValidityStartDate,
      _Sched.ValidityEndDate                 as ValidityEndDate,
      _Sched.PurchasingDocumentOrigin        as PurchasingDocumentOrigin,
      _Sched.PurchasingDocumentDeletionCode  as PurchasingDocumentDeletionCode,
      _Sched.SupplyingSupplier               as SupplyingSupplier,

      _Item.SchedulingAgreementItem          as SchedulingAgreementItem,
      cast(_Item.Material as abap.char(40))  as Material,
      _Item.Plant                            as Plant,
      _Item.OrderQuantityUnit                as OrderQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _Item.TargetQuantity                   as TargetQuantity,
      _Item.RequirementTracking              as RequirementTracking,
      _Item.AccountAssignmentCategory        as AccountAssignmentCategory,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _Item.NetPriceAmount                   as NetPriceAmount,
      @Semantics.quantity.unitOfMeasure: 'OrderPriceUnit'
      _Item.NetPriceQuantity                 as NetPriceQuantity,
      _Item.OrderPriceUnit                   as OrderPriceUnit,
      _Item.StorageLocation                  as StorageLocation,
      _Item.PurchasingInfoRecord             as PurchasingInfoRecord,
      _Item.OrdPriceUnitToOrderUnitDnmntr    as OrdPriceUnitToOrderUnitDnmntr,
      _Item.OrderPriceUnitToOrderUnitNmrtr   as OrderPriceUnitToOrderUnitNmrtr,
      _Item.StockType                        as StockType,

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
      _SupPlan.PlannedDeliveryDurationInDays as PlannedDeliveryDurationInDays,
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
      _Sched.ValidityEndDate                >= $session.system_date
  and _Sched.PurchasingDocumentDeletionCode =  ''
  and _Item.PurchasingDocumentDeletionCode  =  ''
  and _Item.Material                        <> ''
