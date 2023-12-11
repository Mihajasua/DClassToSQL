Class {
	#name : #FamixPraxemGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'class',
		'method',
		'attribute',
		'package',
		'parameter',
		'association',
		'primitiveClass',
		'attributeType',
		'returnValue',
		'type'
	],
	#category : #'Famix-Praxem-Generator'
}

{ #category : #accessing }
FamixPraxemGenerator class >> packageName [

	^ #'Famix-Praxem-Entities'
]

{ #category : #accessing }
FamixPraxemGenerator class >> prefix [

	^ #'FamixPraxem'
]

{ #category : #accessing }
FamixPraxemGenerator class >> submetamodels [
	^ {FamixGenerator}
]

{ #category : #definition }
FamixPraxemGenerator >> defineClasses [

	super defineClasses.

	class := builder newClassNamed: #Class.
	primitiveClass := builder newClassNamed: #PrimitiveClass.
	method := builder newClassNamed: #Method.
	attribute := builder newClassNamed: #Attribute.
	package := builder newClassNamed: #Package.
	attributeType := builder newClassNamed: #AttributeType.
	parameter := builder newClassNamed: #Parameter.
	association := builder newClassNamed: #Association.
	returnValue := builder newClassNamed: #ReturnValue.
	type := builder newClassNamed: #TType
]

{ #category : #definition }
FamixPraxemGenerator >> defineHierarchy [

	super defineHierarchy.

	class --|> #TPackageable.
	class --|> #TClass.
	primitiveClass --|> #TPackageable.
	primitiveClass --|> #TClass.
	method --|> #TMethod.
	attribute --|> #TAttribute.
	package --|> #TPackage.
	attributeType --|> #TTypedEntity.
	parameter --|> #TParameter.
	association --|> #TAssociation.
	returnValue --|> #TNamedEntity.
	returnValue --|> #TTypedEntity.
	type --|> #TType
]

{ #category : #definition }
FamixPraxemGenerator >> defineRelations [

	
	(method property: #returnValue) - (returnValue property: #method)
]
