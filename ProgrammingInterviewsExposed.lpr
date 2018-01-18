{$mode objfpc}{$H+}{$J-}
program ProgrammingInterviewsExposed;

uses UStandard, ULinkedLists;

var
  LinkedList: PSinglyLinkedList;
  Values: array[0..3] of Integer;
  Value: PInteger;
  Element: PListElement;
begin

  Values[0] := 1;
  Values[1] := 2;
  Values[2] := 3;


  LinkedList := NewSinglyLinkedList();

  SinglyLinkedListInsertInFront(LinkedList, @Values[2]);
  SinglyLinkedListInsertInFront(LinkedList, @Values[1]);
  SinglyLinkedListInsertInFront(LinkedList, @Values[0]);

  WriteLn('List size:', LinkedList^.Size);

  Element := LinkedList^.Head;

  while Element <> nil do
  begin
    Value := PInteger(Element^.Data);
    WriteLn('Value:', Value^);
    Element := Element^.next;
  end;

  DestroySinglyLinkedList(LinkedList);







  ReadLn;

end.

