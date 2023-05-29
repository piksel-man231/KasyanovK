unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Memo1: TMemo;
  private

  public

  end;

  TMas = array[0..100] of integer;
  Function f1(var m:TMas;var n:byte):byte;
var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }
Function f1(var m:TMas;var n:byte):byte;
var
  i,j,k,sum,del:byte;
  mid:real;
begin
  mid:=0;
  sum:=0;
  k:=0;
  for i:=0 to n do
  begin
     sum:=sum + m[i];
  end;
  mid:=sum/n;
  del:= Round(mid);
  i:=0;
  while i<n do
    begin
      if m[i] = del then
        begin
          for j:=i to (n-1) do m[j]:=m[j+1];
          dec(n);
          inc(i);
        end;
      inc(i);
      end;
  f1:=del;
  end;

end.

