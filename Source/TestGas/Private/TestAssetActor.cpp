// Fill out your copyright notice in the Description page of Project Settings.


#include "TestAssetActor.h"

// Sets default values
ATestAssetActor::ATestAssetActor()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void ATestAssetActor::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void ATestAssetActor::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

void ATestAssetActor::AttackEnemy(AActor* InActor)
{
	////最好不要Check
	//check( InActor != nullptr );

	//ATestAssetActor* MyAssetActor = CastChecked<ATestAssetActor>(InActor);

	//MyAssetActor->Health -= 10;

	//正确的写法
	ensure(InActor != nullptr);
	ATestAssetActor* MyAssetActor = CastChecked<ATestAssetActor>(InActor);

	//有效性判断
	if (MyAssetActor)
	{
		MyAssetActor->Health -= 10;
	}
	else
	{
		UE_LOG(LogTemp, Error, TEXT("转型失败了！"));
	}

}

