library project1;

{$mode objfpc}{$H+}

uses
  Classes
  { you can add units after this };
Function  F1(A,B: integer): Real; export;
var
  R:Real;
begin
  if A>B then begin
     R:=A/B+7;
  end;
  if A=B then begin
     R:=-125;
  end;
  if A<B then begin
     R:=((3*B)+9)/A;
  end;
end;
     exports
     F1 index 1;
begin
end.

