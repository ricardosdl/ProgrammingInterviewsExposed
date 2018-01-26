unit UStack;

{$mode objfpc}{$H+}{$J-}

interface

uses
  Classes, SysUtils;

type
  PElement = ^TElement;
  PPElement = ^PElement;
  TElement = record
    Next: PElement;
    Data: Pointer;
  end;

  TPrintStackItem = procedure(Item: Pointer);



  function CreateStack(Stack: PPElement): Boolean;
  function DeleteStack(Stack: PPElement): Boolean;
  function Push(Stack: PPElement; Data: Pointer): Boolean;
  function Pop(Stack: PPElement; Data: PPointer): Boolean;
  procedure PrintStack(Stack: PElement; PrintItem: TPrintStackItem);




implementation

function CreateStack(Stack: PPElement): Boolean;
begin
  Stack^ := Nil;
  Result := True;
end;

function DeleteStack(Stack: PPElement): Boolean;
var
  NextElement: PElement;
begin

  while Stack^ <> nil do
  begin
    NextElement := Stack^^.Next;
    Dispose(Stack^);
    Stack^ := NextElement;
  end;

  Result := True;

end;

function Push(Stack: PPElement; Data: Pointer): Boolean;
var
  NewElement: PElement;
begin
  New(NewElement);
  if NewElement = nil then Exit(False);

  NewElement^.Data := Data;
  NewElement^.Next := Stack^;
  Stack^ := NewElement;

  Result := True;


end;

function Pop(Stack: PPElement; Data: PPointer): Boolean;
var
  OldTop: PElement;
begin

  if Stack^ = Nil then Exit(False);

  Data^ := Stack^^.Data;

  OldTop := Stack^;

  Stack^ := Stack^^.Next;

  Dispose(OldTop);

  Exit(True);


end;

procedure PrintStack(Stack: PElement; PrintItem: TPrintStackItem);
begin
  while Stack <> nil do
  begin
    PrintItem(Stack^.Data);
    Stack := Stack^.Next;
  end;
end;

end.

