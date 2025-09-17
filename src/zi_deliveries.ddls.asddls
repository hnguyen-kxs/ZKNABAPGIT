@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery - Basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZI_Deliveries
  as select from I_DeliveryDocumentItem         as _Item
    inner join   I_DeliveryDocument             as _Header   on _Item.DeliveryDocument = _Header.DeliveryDocument
    inner join   I_SDScheduleLineWthOpenRqmtQty as _OpenQty  on  _Item.DeliveryDocument     = _OpenQty.SalesDocument
                                                             and _Item.DeliveryDocumentItem = _OpenQty.SalesDocumentItem
    inner join   I_Customer                     as _Customer on _Header.ShipToParty = _Customer.Customer
{
  key _Item.DeliveryDocument                as DeliveryDocument,
  key _Item.DeliveryDocumentItem            as DeliveryDocumentItem,
      _Item.SDDocumentCategory              as SDDocumentCategory,
      cast(_Item.Material as abap.char(40)) as Material,
      _Item.Plant                           as Plant,
      _Item.StorageLocation                 as StorageLocation,
      @Semantics.quantity.unitOfMeasure: 'DeliveryQuantityUnit'
      _Item.ActualDeliveryQuantity          as ActualDeliveryQuantity,
      _Item.DeliveryQuantityUnit            as DeliveryQuantityUnit,
      _Item.BaseUnit                        as BaseUnit,
      _Item.DeliveryToBaseQuantityDnmntr    as DeliveryToBaseQuantityDnmntr,
      _Item.DeliveryToBaseQuantityNmrtr     as DeliveryToBaseQuantityNmrtr,
      _Item.ProductAvailabilityDate         as ProductAvailabilityDate,
      _Item.DeliveryGroup                   as DeliveryGroup,
      _Item.ReferenceSDDocument             as ReferenceSDDocument,
      _Item.ReferenceSDDocumentItem         as ReferenceSDDocumentItem,
      @Semantics.amount.currencyCode:'TransactionCurrency'
      _Item.NetPriceAmount                  as NetPriceAmount,
      _Item.TransactionCurrency             as TransactionCurrency,

      _Header.DeliveryDocumentType          as DeliveryDocumentType,
      _Header.ShipToParty                   as ShipToParty,
      _Header.ActualGoodsMovementDate       as ActualGoodsMovementDate,
      _OpenQty.SalesDocument                as SalesDocument,
      _OpenQty.SalesDocumentItem            as SalesDocumentItem,
      _OpenQty.ScheduleLine                 as ScheduleLine,
      _OpenQty.SalesDocumentType            as SalesDocumentType,
      _OpenQty.RequirementType              as RequirementType,
      _OpenQty.Batch                        as Batch,
      _OpenQty.AccountAssignmentCategory    as AccountAssignmentCategory,
      _OpenQty.IndependentRqmtMRPRelevancy  as IndependentRqmtMRPRelevancy,

      _Customer.CustomerName
}
where
      _Item.ActualDeliveryQuantity   >  0
  and _Header.OverallSDProcessStatus != 'C'
