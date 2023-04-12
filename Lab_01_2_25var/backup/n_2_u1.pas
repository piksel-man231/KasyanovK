unit N_2_u1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.clear;
  Edit1.clear;
  Edit2.clear;
end;

procedure TForm1.Button1Click(Sender: TObject);
 var
    min,max,i,x,sum,t:Int64;
begin
  min:=StrToInt(Edit1.Text);
  max:=StrToInt(Edit2.Text);
  sum:=0;
  i:=min;
  x:=i mod 3;
  i:=i+3-x;
  t:=i;
  while t<max do {Это при условии что min и max не включены в список, если они включены в список то заменить i<max на i<max+1}
         begin
          if (t mod 2=0) then
             sum:=sum+t;
          t:=t+3;
         end;
  Memo1.Lines.Add('Summ : '+IntToStr(sum));
  while i<max do {Это при условии что min и max не включены в список, если они включены в список то заменить i<max на i<max+1}
        begin
         if (i mod 2=0) then
            Memo1.Lines.Add(IntToStr(i));
         i:=i+3;
        end;
end;

end.

