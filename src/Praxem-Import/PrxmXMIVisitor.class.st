Class {
	#name : #PrxmXMIVisitor,
	#superclass : #Object,
	#instVars : [
		'model',
		'context'
	],
	#category : #'Praxem-Import'
}

{ #category : #accessing }
PrxmXMIVisitor >> context [

	^ context
]

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
	"anXMLElement attributeAt: 'nameOfType' retourne 'Type_Symbol' ou 'Type_simple'
	Ce qui fait que le selector soit égale à 'visitType_Symbol:'
	
	perform:with: sert à appeler le selector avec l'argument anXMLElement
	"

	| selector |
	selector := 'visit'
	            , (anXMLElement attributeAt: 'nameOfType') capitalized
	            , ':'.
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
	"anXMLElement name retourne le nom de l'element, par exemple: 'ownedOperation'
	Ce qui fait que le selector soit égale à 'visitOwnedOperation:'
	
	perform:with: sert à appeler le selector avec l'argument anXMLElement
	"

	| selector |
	anXMLElement name = 'MMdclasse:DiagramRoot'
		ifTrue: [ self visitChildrenNodes: anXMLElement ]
		ifFalse: [
			selector := 'visit' , anXMLElement name capitalized , ':'.
			self perform: selector asSymbol with: anXMLElement ]
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

	modelMethod := model newMethodNamed:
		               (anXMLElement attributeAt: #nameOfop).

	parentEntity addMethod: modelMethod.

	context push: modelMethod.

	self visitChildrenNodes: anXMLElement.

	context pop.

	^ modelMethod
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
PrxmXMIVisitor >> visitOwnedRet: anXMLElement [

	| modelReturnValue |
	self halt.
	modelReturnValue := model newReturnValueNamed:  
		                    (anXMLElement attributeAt: #nameOfRet).

	context top returnValue: modelReturnValue.

	self visitChildrenNodes: anXMLElement
	
	 context pop.
]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitReturnType: anXMLElement [

	"anXMLElement attributeAt: 'nameOfType' retourne 'Type_Symbol' ou 'Type_simple'
	Ce qui fait que le selector soit égale à 'visitType_Symbol:'
	
	perform:with: sert à appeler le selector avec l'argument anXMLElement
	"

	| selector |
	selector := 'visit'
	            , (anXMLElement attributeAt: 'nameOfType') capitalized
	            , ':'.
	self perform: selector asSymbol with: anXMLElement
]

{ #category : #'visiting - XML' }
PrxmXMIVisitor >> visitStringNode: anXMLString [
]

{ #category : #'visiting - MD' }
PrxmXMIVisitor >> visitType_Symbol: anXMLElement [
	"Le context top est soit une PraxemMethod soit un PraxemAttribut
	ici on met le nom (anXMLElement attributeAt: 'nameOfTypeClass') du ReturnType ou du AttributeType
	 dans une propriete de la methode ou de l'attributeAt:
	 
	Dans le PrxmResolver, on recherchera la PrxmClass qui correspond a ce nom"

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
