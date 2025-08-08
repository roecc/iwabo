#pragma once

#include "Kismet/BlueprintFunctionLibrary.h"
#include "IwaboBlueprintFunctionLibrary.generated.h"

UCLASS()
class IWABO_API UIwaboBlueprintFunctionLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()

public:
	UFUNCTION(BlueprintPure, Category = "Utilities|String")
	static FString IntArrayToString(const TArray<int32>& IntArray, bool bShowPlusSign);

	UFUNCTION(BlueprintCallable, Category = "Utilities|Int")
	static bool TryParseInt(const FString& InString, int32& OutValue);
};