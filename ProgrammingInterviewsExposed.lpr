{$mode objfpc}{$H+}{$J-}
program ProgrammingInterviewsExposed;

uses sysutils, UStandard, ULinkedLists, UStack;

procedure PrintIntegerStackItem(IntegerPointer: Pointer);
begin
  WriteLn('Item:', PInteger(IntegerPointer)^);
end;

var
  Stack: PElement;
  Values: array of Integer;
begin

  SetLength(Values, 3);
  Values[0] := 1;
  Values[1] := 2;
  Values[2] := 3;

  CreateStack(@Stack);

  Push(@Stack, @Values[0]);
  Push(@Stack, @Values[1]);
  Push(@Stack, @Values[2]);

  PrintStack(Stack, @PrintIntegerStackItem);




  DeleteStack(@Stack);


  ReadLn;

end.

