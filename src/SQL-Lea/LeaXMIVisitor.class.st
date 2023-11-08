Class {
	#name : #LeaXMIVisitor,
	#superclass : #Object,
	#instVars : [
		'model',
		'context'
	],
	#category : #'SQL-Lea'
}

{ #category : #initialization }
LeaXMIVisitor >> initialize [ 

	super initialize.

	context := Stack new
]

{ #category : #accessing }
LeaXMIVisitor >> model [

	^ model
]

{ #category : #accessing }
LeaXMIVisitor >> model: anObject [

	model := anObject
]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitAssociationEnd: aXMLElement [ 

]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitAttributType: anXMLElement [ 

	| selector |
	selector := 'visit' , (anXMLElement attributeAt: 'nameOfType') capitalized , ':'.
		self perform: selector asSymbol with: anXMLElement

]

{ #category : #'visiting - XML' }
LeaXMIVisitor >> visitChildrenNodes: anXMLNode [
	
	anXMLNode nodes do: [ :child |
		child acceptNodeVisitor: self
	]
]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitClassPackage: anXMLElement [

	| modelClass |
	modelClass := model newClassNamed: (anXMLElement attributeAt: #nameOfClass).
	context ifNotNil: [ 
		context top addChildEntity: modelClass
	].
	context push: modelClass.
		
	self visitChildrenNodes: anXMLElement.

	context pop.

	^modelClass
]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitClassRoot: anXMLElement [

]

{ #category : #'visiting - XML' }
LeaXMIVisitor >> visitDocument: anXMLDocument [

	self visitChildrenNodes: anXMLDocument.
	^model
]

{ #category : #'visiting - XML' }
LeaXMIVisitor >> visitElement: anXMLElement [
	
	| selector |
	(anXMLElement name = 'MMdclasse:DiagramRoot')
	ifTrue: [ self visitChildrenNodes: anXMLElement ]
	ifFalse: [
		selector := 'visit' , anXMLElement name capitalized , ':'.
		self perform: selector asSymbol with: anXMLElement
	].

]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitOwnedAssociation: aXMLElement [ 

]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitOwnedAttribute: anXMLElement [ 

	| parentEntity modelAttribute |
	parentEntity := context top.

	modelAttribute := model newAttributeNamed: (anXMLElement attributeAt: #code).
	parentEntity addAttribute: modelAttribute.
	
	context push: modelAttribute.
	self visitChildrenNodes: anXMLElement.
	context pop.
	
	^modelAttribute
]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitOwnedOperation: anXMLElement [

	| parentEntity modelMethod |
	parentEntity := context top.

	modelMethod := model newMethodNamed: (anXMLElement attributeAt: #nameOfop).

	parentEntity addMethod: modelMethod.
	
	^modelMethod
]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitOwnedPackage: anXMLElement [ 

	| package |
	package := model newPackageNamed: (anXMLElement attributeAt: #nameOfPackage).
	context push: package.
		
	self visitChildrenNodes: anXMLElement.

	context pop.
]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitOwnedParam: aXMLElement [ 
	
]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitOwnedRet: aXMLElement [ 

]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitReturnType: aXMLElement [ 

]

{ #category : #'visiting - XML' }
LeaXMIVisitor >> visitStringNode: anXMLString [
]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitType_Symbol: anXMLElement [ 

	| parentEntity |
	parentEntity := context top.

	parentEntity
		attributeAt: #attributeType
		put: (anXMLElement attributeAt: 'nameOfTypeClass')
]

{ #category : #'visiting - MD' }
LeaXMIVisitor >> visitType_simple: anXMLElement [

	| parentEntity |
	parentEntity := context top.

	parentEntity
		attributeAt: #attributeType
		put: (anXMLElement attributeAt: 'nameOfTypePrim')
]
