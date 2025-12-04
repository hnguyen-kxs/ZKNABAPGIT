@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST, #UNION ]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Reservations - Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #CONSUMPTION
define view entity ZC_KX_Reservations
  as select from ZI_Reservations
{
  key                  Reservation,
  key                  ReservationItem,
  key                  RecordType,
                       Material,
                       RequirementType,
                       MatlCompRequirementDate,
                       Plant,
                       ManufacturingOrderOperation,
                       StorageLocation,
                       DebitCreditCode,
                       GoodsMovementType,
                       CompanyCodeCurrency,
                       IssuingOrReceivingPlant,
                       IssuingOrReceivingStorageLoc,
                       PurchasingDocument,
                       PurchasingDocumentItem,
                       BaseUnit,
                       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
                       ResvnItmRequiredQtyInBaseUnit,
                       @Semantics.quantity.unitOfMeasure: 'BaseUnit'
                       ResvnItmWithdrawnQtyInBaseUnit,
                       Supplier

}
