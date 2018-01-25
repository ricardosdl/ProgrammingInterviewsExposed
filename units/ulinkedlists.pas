unit ULinkedLists;

{$mode objfpc}{$H+}{$J-}

interface

uses
  Classes, SysUtils;

type
  TListElement = record
    Prev: ^TListElement;
    Next: ^TListElement;
    Data: Pointer;

  end;
  PListElement = ^TListElement;

  TSinglyLinkedList = record
    Head: PListElement;
    Tail: PListElement;
    Size: Cardinal;
  end;
  PSinglyLinkedList = ^TSinglyLinkedList;


function NewSinglyLinkedList(): PSinglyLinkedList;
procedure DestroySinglyLinkedList(List: PSinglyLinkedList);
function SinglyLinkedListInsertInFront(List: PSinglyLinkedList; data: Pointer): PListElement;
function SinglyLinkedListFind(List: PSinglyLinkedList; data: Pointer): PListElement;
function SinglyLinkedListDeleteElement(List: PSinglyLinkedList; DeleteMe: PListElement): Boolean;
function SinglyLinkedListInsertBefore(List: PSinglyLinkedList; InsertBeforeMe: PListElement; data: Pointer): PListElement;
procedure PrintList(List: PSinglyLinkedList);



implementation

function NewSinglyLinkedList: PSinglyLinkedList;
begin
  New(Result);
  Result^.Head := nil;
  Result^.Tail := nil;
  Result^.Size := 0;

end;

procedure DestroySinglyLinkedList(List: PSinglyLinkedList);
var
  CurrentElement, NextElement: PListElement;
begin
  CurrentElement := List^.Head;
  while CurrentElement <> nil do
  begin
    NextElement := CurrentElement^.Next;
    Dispose(CurrentElement);
    CurrentElement := NextElement;
  end;

  Dispose(List);

end;

function SinglyLinkedListInsertInFront(List: PSinglyLinkedList; data: Pointer): PListElement;
begin
  New(Result);
  Result^.Data := data;

  Result^.Next := List^.Head;
  List^.Head := Result;

  if List^.Size = 0 then
    List^.Tail := Result;

  Inc(List^.Size);

end;

function SinglyLinkedListFind(List: PSinglyLinkedList; data: Pointer): PListElement;
begin
  Result := List^.Head;
  while (Result <> nil) and (Result^.Data <> data) do
  begin
    Result := Result^.Next;
  end;
end;

function SinglyLinkedListDeleteElement(List: PSinglyLinkedList;
  DeleteMe: PListElement): Boolean;
var
  CurrentElement: PListElement;
begin
  if (List^.Size < 1) or (DeleteMe = nil) then
    Exit(False);

  if DeleteMe = List^.Head then
  begin
    List^.Head := List^.Head^.Next;
    Dispose(DeleteMe);
    Exit(True);
  end;

  CurrentElement := List^.Head;

  while CurrentElement <> nil do
  begin
    if CurrentElement^.Next = DeleteMe then
    begin
      CurrentElement^.Next := DeleteMe^.Next;
      if List^.Tail = DeleteMe then
        List^.Tail := CurrentElement;
      Dispose(DeleteMe);
      Exit(True);
    end;
    CurrentElement := CurrentElement^.Next;
  end;

  Result := False;

end;

function SinglyLinkedListInsertBefore(List: PSinglyLinkedList;
  InsertBeforeMe: PListElement; data: Pointer): PListElement;
var
  CurrentElement: PListElement;
  function NewListElement(Data: Pointer): PListElement;
  begin
    New(Result);
    if Result = nil then
      Exit;

    Result^.Data := Data;

  end;
begin
  Result := nil;

  if List^.Head = InsertBeforeMe then
  begin
    Result := SinglyLinkedListInsertInFront(List, data);
    Exit(Result);
  end;

  CurrentElement := List^.Head;
  while CurrentElement <> nil do
  begin
    if CurrentElement^.Next = InsertBeforeMe then
    begin
      Result := NewListElement(Data);

      if not Assigned(Result) then Exit(Result);

      Result^.Next := CurrentElement^.Next;
      CurrentElement^.Next := Result;
      if List^.Tail = CurrentElement then
      begin
        List^.Tail := Result;
      end;
      Inc(List^.Size);
      Exit(Result);
    end;
    CurrentElement := CurrentElement^.Next;
  end;

end;

procedure PrintList(List: PSinglyLinkedList);
var
  Element: PListElement;
  Value: PInteger;
begin
  WriteLn(Format('===Printing List size:%d===', [List^.Size]));
  Element := List^.Head;

  while Element <> nil do
  begin
    Value := PInteger(Element^.Data);
    WriteLn('Value:', Value^);
    Element := Element^.next;
  end;
  WriteLn(Format('===End Of List===', [List^.Size]));

end;

end.

