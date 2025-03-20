// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "OneActor.generated.h"

UCLASS()
class TESTGAS_API AOneActor : public AActor
{
	GENERATED_BODY()
	
public:	
	// Sets default values for this actor's properties
	AOneActor();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

public:
	//定义供蓝图调用的函数
	UFUNCTION(BlueprintCallable)
	int GetIndex();

	//定义可以扩展的函数
	UFUNCTION( BlueprintImplementableEvent )
	void LuaImp();

	UFUNCTION( BlueprintNativeEvent )
	void LuaNative();

	void LuaNative_Implementation();

	UPROPERTY( EditAnywhere )
	FName name;
private:
	int index;
};
