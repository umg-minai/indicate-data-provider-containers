library "Main" version '0.0.0'

using OMOP version 'v5.4.MIMIC'

include OMOPFunctions

include "IndicateQiElements" called "E"

include "IndicateQi05ThrombembolicPrevention" called "Qi05"

//code "Person 24h Qi05": '2000000105' from E.OMOPSV

//define "Person 24h Qi05": ToOMOPConcept("Person 24h Qi05")

/*define "Person 24h Qi05": OMOP.Concept{
  conceptId: 2000000105
}*/

//OMOPFunctions.StandardConcept('2000000105')

define function ToObservation(indicatorConceptId Integer,
                              result             Tuple{patient OMOP.Person, numerator Integer, denominator Integer, qi Decimal}):
  (1) _
    let dateTime: Now()
      return OMOP.Observation{
               observationConceptId:     indicatorConceptId,
               observationTypeConceptId: 0, // SC(0)
               observationDatetime:      dateTime,
               observationDate:          date from dateTime,
               //person:                   result.patient,
               person:                   null,
               valueAsNumber:            result.qi
             }

context Patient

define Results:
  {
    ToObservation(2000000105, "Qi05".Result)
  }
