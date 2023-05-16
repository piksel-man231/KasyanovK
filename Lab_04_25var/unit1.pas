unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
{Кнопка рандом}
procedure TForm1.Button1Click(Sender: TObject);

var
  i,j,n:Int64;

begin
  n:=0;
  n:=StrToInt(Edit1.Text)-1;
  if n>9
  then begin
    ShowMessage('Слишком большой размер массива');
    exit;
  end
  else begin
    for i:=0 to n do
      for j:=0 to n do
          StringGrid1.Cells[i,j]:= Format('%6d',[100-Random(200)]);
  end;
end;

{Нажимаем магическуюю кнопку}

procedure TForm1.Button2Click(Sender: TObject);

var
i,n,j,t,max,temp:Int64;
a: array [1..10] of Int64;
mid: Real;

begin
  n:=0;
  mid:=0;
  n:=StrToInt(Edit1.Text)-1;
  if n>9
  then begin
    ShowMessage('Слишком большой размер массива');
    exit;
  end
  else begin
      for i:=0 to n do begin
        max:= -101;
        for j:=0 to n do begin
          t:=StrToInt(StringGrid1.Cells[j,i]);
          if t>max then max:=t;
        end;
        a[i+1]:=max;
        mid:=mid+(max/(n+1));
      end;
  end;
  for i:=1 to n+1 do
    Memo1.Lines.Add(intToStr(a[i]));
  Memo1.Lines.Add('Среднее значение: '+FloatToStr(mid));
end;

end.
17.8
4.8
9.2
8.2
1
