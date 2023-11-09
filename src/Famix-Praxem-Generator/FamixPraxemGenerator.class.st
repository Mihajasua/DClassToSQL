Class {
	#name : #FamixPraxemGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'class',
		'method',
		'attribute',
		'package',
		'attributeType',
		'parameter',
		'association'
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
	method := builder newClassNamed: #Method.
	attribute := builder newClassNamed: #Attribute. 
	package := builder newClassNamed: #Package.
	attributeType := builder newClassNamed: #AttributeType.
	parameter:= builder newClassNamed: #Parameter.
	association := builder newClassNamed: #Association.
]

{ #category : #definition }
FamixPraxemGenerator >> defineHierarchy [

	super defineHierarchy.
	
	class --|> #TPackageable.
	class --|> #TClass.
	method --|> #TMethod.
	attribute --|> #TAttribute.
	package --|> #TPackage.
	attributeType --|> #TTypedEntity.
	parameter --|> #TParameter.
	association --|> #TAssociation.
	
	
	
	
]
