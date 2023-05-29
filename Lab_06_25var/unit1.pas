unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Unit2, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    B1: TButton;
    B2: TButton;
    E2: TEdit;
    Label1: TLabel;
    L2: TLabel;
    procedure B1Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

var
  mas:TMas;
  n_mas:byte;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
    n_mas:=0;

end;

procedure TForm1.B1Click(Sender: TObject);
var
  str:String;
  i:byte;
begin
  //mas[n_mas]:=E2.Text.ToInt;
  mas[n_mas]:= StrToInt(string(E2.Text));
  inc(n_mas);
  L2.Caption:=IntToStr(n_mas);
  for i:=0 to (n_mas-1) do
  begin
    if i>0 then str:=str+', ';
    str:= str + IntToStr(mas[i]);
  Form2.Memo1.Clear;
  Form2.Memo1.Lines.Add(str);
  end;
end;

procedure TForm1.B2Click(Sender: TObject);
var
  str:String;
  h,i:byte;
begin
  Form2.Show;
  h:= f1(mas, n_mas);
  for i:=0 to (n_mas-1) do
  begin
    if i>0 then str:=str+', ';
    str:= str + IntToStr(mas[i]);
  end;
  Form2.Memo1.Lines.Add('Massiv posle udaleniya: ');
  Form2.Memo1.Lines.Add(str);
  Form2.Memo1.Lines.Add('Srednee znacheniye: '+IntToStr(h));
end;

end.

