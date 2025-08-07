#include "IwaboBlueprintFunctionLibrary.h"

FString UIwaboBlueprintFunctionLibrary::IntArrayToString(const TArray<int32>& IntArray, bool bShowPlusSign)
{
	FString Result;
	for (int32 i = 0; i < IntArray.Num(); ++i)
	{
		int32 Value = IntArray[i];
		if (bShowPlusSign && Value >= 0)
		{
			Result.Append(TEXT("+"));
		}

		Result.Append(FString::FromInt(Value));

		if (i < IntArray.Num() - 1)
		{
			Result.Append(TEXT(","));
		}
	}
	return Result;
}