Class {
	#name : #PrxmResolver,
	#superclass : #Object,
	#category : #'Praxem-Import'
}

{ #category : #'as yet unclassified' }
PrxmResolver >> checkAttributeType: aModel [
	"checkAttributeType method for determining the value type of an attribute in declaredType"
	
	| praxemClass |
	(aModel allWithType: FamixPraxemAttribute) do: 
		[ :anAttribute | 
			praxemClass := (
				(aModel allWithType: FamixPraxemPrimitiveClass) 
					detect: [
						:aClass | aClass name = (anAttribute attributeAt: #attributeType ifAbsent: '')
					]
					ifNone: [
						(aModel allWithType: FamixPraxemClass) 
					detect: [:aClass |
						aClass name = (anAttribute attributeAt: #attributeType ifAbsent: '')]
					ifNone: [nil]
					]
			).
			
			anAttribute declaredType: praxemClass.
		]


	

]
