Class {
	#name : #PrxmAbstractVisitor,
	#superclass : #Object,
	#category : #'Praxem-To-SQL'
}

{ #category : #visiting }
PrxmAbstractVisitor >> visitPraxemAssociation: aPraxemAssociation [
]

{ #category : #visiting }
PrxmAbstractVisitor >> visitPraxemAttribute: aPraxemAttribute [

	aPraxemAttribute declaredType ifNotNil: [ :type | type accept: self ]
]

{ #category : #visiting }
PrxmAbstractVisitor >> visitPraxemClass: aPraxemClass [

	^self visitPraxemEntityWithChildren: aPraxemClass 
]

{ #category : #visiting }
PrxmAbstractVisitor >> visitPraxemEntityWithChildren: aPraxemEntity [

	^aPraxemEntity children collect: [ :child |
		child accept: self
	]
]

{ #category : #visiting }
PrxmAbstractVisitor >> visitPraxemMethod: aPraxemMethod [

	self visitPraxemEntityWithChildren: aPraxemMethod.
	aPraxemMethod declaredType ifNotNil: [ :type | type accept: self]
]

{ #category : #visiting }
PrxmAbstractVisitor >> visitPraxemModel: aPraxemModel [

	aPraxemModel allPackages collect: [ :package |
		package accept: self
	]
]

{ #category : #visiting }
PrxmAbstractVisitor >> visitPraxemPackage: aPraxemPackage [

	^self visitPraxemEntityWithChildren: aPraxemPackage 
]

{ #category : #visiting }
PrxmAbstractVisitor >> visitPraxemParameter: aPraxemParameter [


	aPraxemParameter declaredType ifNotNil: [ :type | type accept: self]
]

{ #category : #visiting }
PrxmAbstractVisitor >> visitePraxemAttributeType: aPraxemAttributeType [
]
