Class {
	#name : #FamixPraxemEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-Praxem-Entities-Entities'
}

{ #category : #meta }
FamixPraxemEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Praxem-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixPraxemEntity class >> isAbstract [

	<generated>
	^ self == FamixPraxemEntity
]

{ #category : #meta }
FamixPraxemEntity class >> metamodel [

	<generated>
	^ FamixPraxemModel metamodel
]

{ #category : #testing }
FamixPraxemEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixPraxemEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixPraxemEntity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixPraxemEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixPraxemEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixPraxemEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixPraxemEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixPraxemEntity >> isType [

	<generated>
	^ false
]
