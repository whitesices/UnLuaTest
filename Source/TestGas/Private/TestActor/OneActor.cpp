// Fill out your copyright notice in the Description page of Project Settings.


#include "TestActor/OneActor.h"

// Sets default values
AOneActor::AOneActor()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
	index = 300;
}

// Called when the game starts or when spawned
void AOneActor::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AOneActor::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

int AOneActor::GetIndex()
{
	LuaNative();
	return index++;
}

void AOneActor::LuaNative_Implementation()
{
	LuaImp();
}

