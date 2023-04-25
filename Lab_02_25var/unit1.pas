unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Memo1: TMemo;
    Shape1: TShape;
    procedure Button1Click (Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  ax1,ay1,ax2,ay2:Int64;
  bx1,bx2,by1,by2:Int64;
  v1,w1,v2,w2:Int64;
  t1,t2,xp,yp:Real;



implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
begin
  ax1:=StrToInt(Edit1.Text);
  ax2:=StrToInt(Edit2.Text);
  ay1:=StrToInt(Edit5.Text);
  ay2:=StrToInt(Edit6.Text);
  bx1:=StrToInt(Edit3.Text);
  bx2:=StrToInt(Edit4.Text);
  by1:=StrToInt(Edit7.Text);
  by2:=StrToInt(Edit8.Text);

  v1:=ax2-ax1;
  v2:=bx2-bx1;
  w1:=ay2-ay1;
  w2:=by2-by1;

  {t2=(ax1+v1*((bx1+v2*t2-ax1)/v1)-bx1)/v2;}

  t1:=(bx1+v2*((ay1+w1*t1-by1)/w2)-ax1)/v1;
  Memo1.Clear;
  {Memo1.Lines.Add('t1 = '+FloatToStr(t1));}
  t2:=(ay1+w1*t1-by1)/w2;
  {Memo1.Lines.Add('t2 = '+FloatToStr(t2));}
  if (0<t1) and (t1<1) and (0<t2) and (t2<1) then
    begin
    xp:=ax1+v1*t1;
    yp:=ay1+w1*t1;
    Memo1.Lines.Add('Координаты пересечения : '+ FloatToStr(xp) + ';' +FloatToStr(yp));
    end
    else
      begin
       Memo1.Lines.Add('Прямые не пересекаются')
      end;

end;
end.

