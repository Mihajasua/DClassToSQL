Class {
	#name : #FamixPraxemClass,
	#superclass : #FamixPraxemEntity,
	#traits : 'FamixTClass + FamixTPackageable',
	#classTraits : 'FamixTClass classTrait + FamixTPackageable classTrait',
	#category : #'Famix-Praxem-Entities-Entities'
}

{ #category : #meta }
FamixPraxemClass class >> annotation [

	<FMClass: #Class super: #FamixPraxemEntity>
	<package: #'Famix-Praxem-Entities'>
	<generated>
	^ self
]
