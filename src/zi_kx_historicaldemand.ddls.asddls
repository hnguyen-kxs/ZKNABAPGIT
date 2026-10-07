@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HistoricalDemand - Composite'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZI_KX_HistoricalDemand
  with parameters
    p_days : int2
  as select from    ZI_Delivery_HDA( p_days: $parameters.p_days ) as _Delivery
    inner join      ZI_SalesOrders_HDA                            as _Sales    on  _Delivery.ReferenceSDDocument     = _Sales.SalesDocument
                                                                               and _Delivery.ReferenceSDDocumentItem = _Sales.SalesDocumentItem
    left outer join I_Customer                                    as _Customer on _Sales.SoldToParty = _Customer.Customer
{
  key _Delivery.DeliveryDocument                as DeliveryDocument,
  key _Delivery.DeliveryDocumentItem            as DeliveryDocumentItem,
      _Sales.SalesDocument                      as SalesDocument,
      _Sales.SalesDocumentItem                  as SalesDocumentItem,
      _Sales.ScheduleLine                       as ScheduleLine,
      _Customer.Customer                        as Customer,
      _Delivery.ShipToParty                     as ShipToParty,
      _Delivery.DeliveryDocumentType            as DeliveryDocumentType,
      _Delivery.ActualGoodsMovementDate         as ActualGoodsMovementDate,
      _Delivery.DeliveryGroup                   as DeliveryGroup,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      _Delivery.ActualDeliveryQuantity          as ActualDeliveryQuantity,
      _Delivery.StorageLocation                 as StorageLocation,
      cast(_Delivery.Material as abap.char(40)) as Material,
      _Delivery.ProductAvailabilityDate         as ProductAvailabilityDate,
      _Delivery.BaseUnit                        as BaseUnit,
      _Delivery.NetPriceAmount                  as NetPriceAmount,
      _Delivery.DeliveryToBaseQuantityDnmntr    as DeliveryToBaseQuantityDnmntr,
      _Delivery.DeliveryToBaseQuantityNmrtr     as DeliveryToBaseQuantityNmrtr,
      _Delivery.ReferenceSDDocument             as ReferenceSDDocument,
      _Delivery.ReferenceSDDocumentItem         as ReferenceSDDocumentItem,
      _Delivery.DeliveryQuantityUnit            as DeliveryQuantityUnit,
      _Delivery.Plant                           as Plant,
      _Sales.IndependentRequirementType         as IndependentRequirementType,
      _Sales.MRPArea                            as MRPAreaSales,
      _Sales.DeliveryGroup                      as DeliveryGroupSales,
      _Sales.ConfdDelivQtyInOrderQtyUnit        as ConfdDelivQtyInOrderQtyUnit,
      _Sales.BaseUnit                           as NetPriceQuantityUnit,
      _Sales.NetPriceQuantity                   as NetPriceQuantity,
      _Sales.PartialDeliveryIsAllowed           as PartialDeliveryIsAllowed,
      _Sales.ItemIsDeliveryRelevant             as ItemIsDeliveryRelevant,
      _Sales.StorageLocation                    as StorageLocationSales,
      _Sales.DeliveryPriority                   as DeliveryPriority,
      cast(_Sales.Material as abap.char(40))    as MaterialSales,
      _Sales.BaseUnit                           as BaseUnitSales,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _Sales.NetPriceAmount                     as NetPriceAmountSales,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      _Sales.NetAmount                          as NetAmount,
      _Sales.UnderlyingPurchaseOrderItem        as UnderlyingPurchaseOrderItem,
      _Sales.SalesDocumentItemCategory          as SalesDocumentItemCategory,
      _Sales.WBSElement                         as WBSElement,
      _Sales.Route                              as Route,
      _Sales.BOMExplosionDate                   as BOMExplosionDate,
      _Sales.HigherLevelItem                    as HigherLevelItem,
      _Sales.OrderToBaseQuantityDnmntr          as OrderToBaseQuantityDnmntr,
      _Sales.OrderToBaseQuantityNmrtr           as OrderToBaseQuantityNmrtr,
      _Sales.TargetToBaseQuantityNmrtr          as TargetToBaseQuantityNmrtr,
      _Sales.OrderQuantityUnit                  as OrderQuantityUnit,
      _Sales.ShippingPoint                      as ShippingPoint,
      _Sales.TransactionCurrency                as TransactionCurrency,
      _Sales.Plant                              as PlantSales,
      _Sales.TargetQuantityUnit                 as TargetQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'TargetQuantityUnit'
      _Sales.TargetQuantity                     as TargetQuantity,
      @Semantics.quantity.unitOfMeasure: 'TargetQuantityUnit'
      _Sales.ConfdOrderQtyByMatlAvailCheck      as ConfdOrderQtyByMatlAvailCheck,
      _Sales.DeliveryDate                       as DeliveryDate,
      _Sales.ProductAvailabilityDate            as ProductAvailDateSales,
      _Sales.CreationDate                       as CreationDateItem,
      _Sales.CreatedOnHeader                    as CreationDate,
      _Sales.SoldToParty                        as SoldToParty,
      _Sales.SalesDocumentType                  as SalesDocumentType,
      _Sales.CustomerGroup                      as CustomerGroup,
      _Customer.Industry                        as Industry,
      _Customer.CustomerAccountGroup            as CustomerAccountGroup,
      _Customer.CustomerName                    as CustomerName
}
