// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Kismet/BlueprintFunctionLibrary.h"
#include "TestLuaUtils.generated.h"

/**
 * 
 */
UCLASS()
class TESTGAS_API UTestLuaUtils : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()

	//自定义供蓝图调用的函数
	UFUNCTION( BlueprintCallable )
	static int GetInt();
	
};
