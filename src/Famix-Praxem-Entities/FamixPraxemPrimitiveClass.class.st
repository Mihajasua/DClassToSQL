Class {
	#name : #FamixPraxemPrimitiveClass,
	#superclass : #FamixPraxemEntity,
	#traits : 'FamixTClass + FamixTPackageable',
	#classTraits : 'FamixTClass classTrait + FamixTPackageable classTrait',
	#category : #'Famix-Praxem-Entities-Entities'
}

{ #category : #meta }
FamixPraxemPrimitiveClass class >> annotation [

	<FMClass: #PrimitiveClass super: #FamixPraxemEntity>
	<package: #'Famix-Praxem-Entities'>
	<generated>
	^ self
]
