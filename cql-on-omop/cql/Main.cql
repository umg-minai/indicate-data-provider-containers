library "Main" version '0.0.0'

using OMOP version 'v5.4.MIMIC'

include OMOPFunctions

include "IndicateQiElements" called "E"

include "IndicateQi01Ventilation"             called "Qi01"
//include "IndicateQi02Weaning"                 called "Qi02"
include "IndicateQi03Feeding"                 called "Qi03"
include "IndicateQi04GlucoseControl"          called "Qi04"
include "IndicateQi05ThrombembolicPrevention" called "Qi05"
//include "IndicateQi06InfectionRate"           called "Qi06"
include "IndicateQi07PainSedationDelir"       called "Qi07"
//include "IndicateQi08AdvancedCarePlan"        called "Qi08"
//include "IndicateQi09Mobilisation"            called "Qi09"

define function ToObservation(indicatorConceptId Integer,
                              result             Tuple{patient     OMOP.Person,
                                                       numerator   Integer,
                                                       denominator Integer,
                                                       qi          Decimal}):
  (1) _
    let dateTime: Now()
      return OMOP.Observation{
               observationConceptId:   indicatorConceptId,
               observationTypeConcept: OMOPFunctions.SC(0),
               observationDatetime:    dateTime,
               observationDate:        date from dateTime,
               //person:                 result.patient,
               person:                 null,
               valueAsNumber:          result.qi
             }

context Patient

define Results:
  {
    ToObservation(2000000101, "Qi01".Result),
    //ToObservation(2000000102, "Qi02".Result),
    ToObservation(2000000103, "Qi03".Result),
    ToObservation(2000000104, "Qi04".Result),
    ToObservation(2000000105, "Qi05".Result),
    //ToObservation(2000000106, "Qi06".Result),
    ToObservation(2000000107, "Qi07".Result)
    //ToObservation(2000000108, "Qi08".Result),
    //ToObservation(2000000109, "Qi09".Result)
  }
