Class {
	#name : #PrxmXMIVisitor,
	#superclass : #Object,
	#instVars : [
		'model',
		'context'
	],
	#category : #'Praxem-Import'
}

{ #category : #initialization }
PrxmXMIVisitor >> initialize [ 

	super initialize.

	context := Stack new
]

{ #category : #accessing }
PrxmXMIVisitor >> model [
	  ^ model
]

{ #category : #accessing }
PrxmXMIVisitor >> model: anObject [

	model := anObject
]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitAssociationEnd: aXMLElement [ 

]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitAttributType: anXMLElement [ 

	| selector |
	selector := 'visit' , (anXMLElement attributeAt: 'nameOfType') capitalized , ':'.
	self perform: selector asSymbol with: anXMLElement

]

{ #category : #'visiting - XML' }
PrxmXMIVisitor >> visitChildrenNodes: anXMLNode [
	
	anXMLNode nodes do: [ :child |
		child acceptNodeVisitor: self
	]
]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitClassPackage: anXMLElement [

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
PrxmXMIVisitor >> visitClassRoot: anXMLElement [

]

{ #category : #'visiting - XML' }
PrxmXMIVisitor >> visitDocument: anXMLDocument [

	self visitChildrenNodes: anXMLDocument.
	^model
]

{ #category : #'visiting - XML' }
PrxmXMIVisitor >> visitElement: anXMLElement [
	
	| selector |
	(anXMLElement name = 'MMdclasse:DiagramRoot')
	ifTrue: [ self visitChildrenNodes: anXMLElement ]
	ifFalse: [
		selector := 'visit' , anXMLElement name capitalized , ':'.
		self perform: selector asSymbol with: anXMLElement
	].

]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitOwnedAssociation: aXMLElement [ 

]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitOwnedAttribute: anXMLElement [ 

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
PrxmXMIVisitor >> visitOwnedOperation: anXMLElement [

	| parentEntity modelMethod |
	parentEntity := context top.

	modelMethod := model newMethodNamed: (anXMLElement attributeAt: #nameOfop).

	parentEntity addMethod: modelMethod.
	
	^modelMethod
]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitOwnedPackage: anXMLElement [ 

	| package |
	package := model newPackageNamed: (anXMLElement attributeAt: #nameOfPackage).
	context push: package.
		
	self visitChildrenNodes: anXMLElement.

	context pop.
]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitOwnedParam: aXMLElement [ 
	
]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitOwnedRet: aXMLElement [ 

]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitReturnType: aXMLElement [ 

]

{ #category : #'visiting - XML' }
PrxmXMIVisitor >> visitStringNode: anXMLString [
]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitType_Symbol: anXMLElement [ 

	| parentEntity |

	parentEntity := context top.
	
	parentEntity
		attributeAt: #attributeType
		put: (anXMLElement attributeAt: 'nameOfTypeClass')
		

		
	
]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitType_simple: anXMLElement [

	| parentEntity |
	parentEntity := context top.

	parentEntity
		attributeAt: #attributeType
		put: (anXMLElement attributeAt: 'nameOfTypePrim')
]
