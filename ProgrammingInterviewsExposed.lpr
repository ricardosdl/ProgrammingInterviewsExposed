{$mode objfpc}{$H+}{$J-}
program ProgrammingInterviewsExposed;

uses UStandard, ULinkedLists;

var
  LinkedList: PSinglyLinkedList;
  Values: array[0..3] of Integer;
  Value: PInteger;
  StackValue: Integer;
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

  PrintList(LinkedList);

  StackValue := 6;
  Element := SinglyLinkedListFind(LinkedList, @StackValue);
  if Element <> nil then
  begin
    WriteLn('Found:', PInteger(Element^.Data)^);
  end
  else
    WriteLn('Nothing Found');

  SinglyLinkedListInsertInFront(LinkedList, @StackValue);

  Element := SinglyLinkedListFind(LinkedList, @Values[1]);
  if Element <> nil then
  begin
    WriteLn('Found:', PInteger(Element^.Data)^);
  end
  else
    WriteLn('Nothing Found');

  WriteLn('====Deleting elements====');

  if SinglyLinkedListDeleteElement(LinkedList, Element) then
  begin
    WriteLn('Deleted element');
  end;

  Element := SinglyLinkedListFind(LinkedList, @Values[2]);
  if SinglyLinkedListDeleteElement(LinkedList, Element) then
  begin
    WriteLn('Deleted element');
  end;

  SinglyLinkedListDeleteElement(LinkedList, SinglyLinkedListFind(LinkedList, @StackValue));


  PrintList(LinkedList);






  DestroySinglyLinkedList(LinkedList);







  ReadLn;

end.

