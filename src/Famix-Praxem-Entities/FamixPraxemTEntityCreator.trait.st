"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixPraxemTEntityCreator,
	#category : #'Famix-Praxem-Entities-Model'
}

{ #category : #meta }
FamixPraxemTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Praxem-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newAssociation [

	<generated>
	^ self add: FamixPraxemAssociation new
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newAttribute [

	<generated>
	^ self add: FamixPraxemAttribute new
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newAttributeNamed: aName [

	<generated>
	^ self add: (FamixPraxemAttribute named: aName)
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newAttributeType [

	<generated>
	^ self add: FamixPraxemAttributeType new
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newClass [

	<generated>
	^ self add: FamixPraxemClass new
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newClassNamed: aName [

	<generated>
	^ self add: (FamixPraxemClass named: aName)
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newMethod [

	<generated>
	^ self add: FamixPraxemMethod new
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newMethodNamed: aName [

	<generated>
	^ self add: (FamixPraxemMethod named: aName)
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newPackage [

	<generated>
	^ self add: FamixPraxemPackage new
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newPackageNamed: aName [

	<generated>
	^ self add: (FamixPraxemPackage named: aName)
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newParameter [

	<generated>
	^ self add: FamixPraxemParameter new
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newParameterNamed: aName [

	<generated>
	^ self add: (FamixPraxemParameter named: aName)
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newPrimitiveClass [

	<generated>
	^ self add: FamixPraxemPrimitiveClass new
]

{ #category : #'entity creation' }
FamixPraxemTEntityCreator >> newPrimitiveClassNamed: aName [

	<generated>
	^ self add: (FamixPraxemPrimitiveClass named: aName)
]
