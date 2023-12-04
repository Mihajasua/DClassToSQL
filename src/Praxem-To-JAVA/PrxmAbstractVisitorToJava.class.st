Class {
	#name : #PrxmAbstractVisitorToJava,
	#superclass : #Object,
	#category : #'Praxem-To-JAVA'
}

{ #category : #visiting }
PrxmAbstractVisitorToJava >> visitPraxemAssociation: aPraxemAssociation [
]

{ #category : #visiting }
PrxmAbstractVisitorToJava >> visitPraxemAttribute: aPraxemAttribute [

	aPraxemAttribute declaredType ifNotNil: [ :type | type accept: self ]
]

{ #category : #visiting }
PrxmAbstractVisitorToJava >> visitPraxemClass: aPraxemClass [

	^self visitPraxemEntityWithChildren: aPraxemClass 
]

{ #category : #visiting }
PrxmAbstractVisitorToJava >> visitPraxemEntityWithChildren: aPraxemEntity [

	^aPraxemEntity children collect: [ :child |
		child accept: self
	]
]

{ #category : #visiting }
PrxmAbstractVisitorToJava >> visitPraxemMethod: aPraxemMethod [

	self visitPraxemEntityWithChildren: aPraxemMethod.
	aPraxemMethod declaredType ifNotNil: [ :type | type accept: self]
]

{ #category : #visiting }
PrxmAbstractVisitorToJava >> visitPraxemModel: aPraxemModel [

	aPraxemModel allPackages collect: [ :package |
		package accept: self
	]
]

{ #category : #visiting }
PrxmAbstractVisitorToJava >> visitPraxemPackage: aPraxemPackage [

	^self visitPraxemEntityWithChildren: aPraxemPackage 
]

{ #category : #visiting }
PrxmAbstractVisitorToJava >> visitPraxemParameter: aPraxemParameter [


	aPraxemParameter declaredType ifNotNil: [ :type | type accept: self]
]

{ #category : #visiting }
PrxmAbstractVisitorToJava >> visitePraxemAttributeType: aPraxemAttributeType [
]
