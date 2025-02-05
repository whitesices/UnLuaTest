// Fill out your copyright notice in the Description page of Project Settings.


#include "TestActor.h"

// Sets default values
ATestActor::ATestActor()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void ATestActor::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void ATestActor::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

void ATestActor::InitArray()
{
	IntArray1.Init(10,5);
	IntArray2 = { 1 ,2 ,3 , 4 ,5 ,6};
}

float ATestActor::TestBlueprintPureFunction()
{
	return 0.0f;
}

float ATestActor::TestBlueprintCallableFunction()
{
	return 0.0f;
}

int32 ATestActor::TestBlueprintCallableConstFunction() const
{
	return int32();
}

int32 ATestActor::TestBlueprintPureFalseFunction() const
{
	return int32();
}

