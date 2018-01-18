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
var
  NewHead: PListElement;
begin
  New(NewHead);
  NewHead^.Data := data;

  NewHead^.Next := List^.Head;
  List^.Head := NewHead;

  if List^.Size = 0 then
    List^.Tail := NewHead;

  Inc(List^.Size);

  Result := NewHead;

end;

end.
