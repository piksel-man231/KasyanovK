unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    B1: TButton;
    E1: TEdit;
    E2: TEdit;
    M1: TMemo;
    procedure B1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;
function F1(A,B: integer): Real; external'Func1';
function F2(A,B: integer):Real;


var
  Form1: TForm1;
  i,j:integer;
implementation
function F2(A,B:integer):Real;
begin
  if A>B then begin
  F2:=A*B/4;
  end;
  if A=B then begin
  F2:=-55;
  end;
  if A<B then begin
  F2:=(B-5)/A
  end;
end;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  M1.Clear;

end;

procedure TForm1.B1Click(Sender: TObject);
begin
  i:=StrToInt(E1.Text);
  M1.Lines.Add('Staticheskiy VbIzov:A '+IntToStr(i));
  j:=StrToInt(E2.Text);
  M1.Lines.Add('Staticheskiy VbIzov:B '+IntToStr(j));
  M1.Lines.Add('Staticheskiy VbIzov: '+FloatToStr(F1(i,j)));
  M1.Lines.Add('Dinamicheskiy VbIzov: '+FloatToStr(F2(i,j)));
end;

end.

