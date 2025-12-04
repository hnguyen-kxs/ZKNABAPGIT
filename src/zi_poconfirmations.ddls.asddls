@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'PO Confirmation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_POConfirmations
  as select from    I_POSupplierConfirmationAPI01 as _POConf
    inner join      I_PurchaseOrderItemAPI01      as _POItem   on  _POConf.PurchaseOrder     = _POItem.PurchaseOrder
                                                               and _POConf.PurchaseOrderItem = _POItem.PurchaseOrderItem
    inner join      I_PurchaseOrderAPI01          as _POOrder  on _POConf.PurchaseOrder = _POOrder.PurchaseOrder
    left outer join I_Supplier                    as _Supplier on _POOrder.Supplier = _Supplier.Supplier

{
  key _POConf.PurchaseOrder                   as PurchaseOrder,
  key _POConf.PurchaseOrderItem               as PurchaseOrderItem,
  key _POConf.SequentialNmbrOfSuplrConf       as SequentialNmbrOfSuplrConf,
      _POConf.SupplierConfirmationCategory    as SupplierConfirmationCategory,
      _POConf.DeliveryDate                    as DeliveryDate,
      _POConf.DelivDateCategory               as DelivDateCategory,
      _POConf.DeliveryTime                    as DeliveryTime,
      _POConf.CreationDate                    as CreationDate,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _POConf.ConfirmedQuantity               as ConfirmedQuantity,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      _POConf.MRPRelevantQuantity             as MRPRelevantQuantity,
      _POConf.SuplrConfCreationCategory       as SuplrConfCreationCategory,
      _POConf.IsDeleted                       as IsDeleted,
      _POConf.ConfIsRelevantToMRP             as ConfIsRelevantToMRP,
      _POConf.SupplierConfirmationExtNumber   as SupplierConfirmationExtNumber,
      _POConf.DeliveryDocument                as DeliveryDocument,
      _POConf.DeliveryDocumentItem            as DeliveryDocumentItem,
      _POConf.ManufacturerPartProfile         as ManufacturerPartProfile,
      _POConf.ManufacturerMaterial            as ManufacturerMaterial,
      _POConf.Batch                           as Batch,
      _POConf.OrderQuantityUnit               as OrderQuantityUnit,

      _POItem.PurchaseOrderCategory           as PurchaseOrderCategory,
      _POItem.DocumentCurrency                as DocumentCurrencyPOItem,
      cast(_POItem.Material as abap.char(40)) as Material,
      _POItem.Plant                           as Plant,
      _POItem.Subcontractor                   as Subcontractor,
      _POItem.SupplierIsSubcontractor         as SupplierIsSubcontractor,
      _POItem.StorageLocation                 as StorageLocation,
      _POItem.PurchaseOrderQuantityUnit       as PurchaseOrderQuantityUnit,
      _POItem.OrderItemQtyToBaseQtyNmrtr      as OrderItemQtyToBaseQtyNmrtr,
      _POItem.OrderItemQtyToBaseQtyDnmntr     as OrderItemQtyToBaseQtyDnmntr,
      _POItem.NetPriceQuantity                as NetPriceQuantity,
      _POItem.PlannedDeliveryDurationInDays   as PlannedDeliveryDurationInDays,
      _POItem.GoodsReceiptDurationInDays      as GoodsReceiptDurationInDays,
      _POItem.PurchaseOrderItemCategory       as PurchaseOrderItemCategory,
      _POItem.OrderPriceUnit                  as OrderPriceUnit,
      _POItem.AccountAssignmentCategory       as AccountAssignmentCategory,
      _POItem.PurchasingInfoRecord            as PurchasingInfoRecord,
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      _POItem.OrderQuantity                   as OrderQuantity,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _POItem.NetPriceAmount                  as NetPriceAmount,
      _POItem.OrderPriceUnitToOrderUnitNmrtr  as OrderPriceUnitToOrderUnitNmrtr,
      _POItem.OrdPriceUnitToOrderUnitDnmntr   as OrdPriceUnitToOrderUnitDnmntr,
      _POItem.StockType                       as StockType,
      _POItem.InventorySpecialStockType       as InventorySpecialStockType,

      _POOrder.PurchaseOrderType              as PurchaseOrderType,
      _POOrder.PurchasingDocumentOrigin       as PurchasingDocumentOrigin,
      _POOrder.PurchaseOrderDate              as PurchaseOrderDate,
      _POOrder.PurchasingDocumentDeletionCode as PurchasingDocumentDeletionCode,
      _POOrder.ReleaseCode                    as ReleaseCode,
      _POOrder.PurchasingOrganization         as PurchasingOrganization,
      _POOrder.Supplier                       as Supplier,
      _POOrder.SupplyingSupplier              as SupplyingSupplier,
      _POOrder.SupplyingPlant                 as SupplyingPlant,
      _POOrder.DocumentCurrency               as DocumentCurrency,
      _POOrder.ValidityStartDate              as ValidityStartDate,
      _POOrder.ValidityEndDate                as ValidityEndDate,

      _Supplier.SupplierName                  as SupplierName

}
where
       _POConf.ConfirmedQuantity               >  0
  and  _POConf.IsDeleted                       != 'X'
  and  _POConf.ConfIsRelevantToMRP             =  'X'
  and(
       _POConf.SuplrConfCreationCategory       =  '1'
    or _POConf.SuplrConfCreationCategory       =  '2'
    or _POConf.SuplrConfCreationCategory       =  '3'
  )
  and  _POItem.PurchasingDocumentDeletionCode  =  ''
  and  _POItem.IsCompletelyDelivered           =  ''
  and  _POItem.IsFinallyInvoiced               =  ''
  and  _POItem.Material                        <> ''
  and  _POItem.OrderQuantity                   >  0
  and  _POItem.PurchaseOrderCategory           <> 'A'
  and  _POOrder.PurchasingDocumentDeletionCode =  ''
