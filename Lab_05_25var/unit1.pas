unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    B1: TButton;
    B2: TButton;
    FN: TEdit;
    FC: TEdit;
    FB: TEdit;
    FBO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    G1: TStringGrid;
    G2: TStringGrid;
    procedure B1Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

type
  Movie = record
    Title: string;
    Country: string;
    ProductionCost: integer;
    BoxOfficeRevenue: integer;
  end;

var
  Movies: array of Movie;
  i, MaxCount, MaxIndex: integer;
  Countries: array of string;
  strnum: integer;

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
begin
  strnum:=1;
end;

function CountMoviesByCountry(Movies: array of Movie; Country: string): integer;
var
  Count: integer;
begin
  Count := 0;
  for i := 0 to Length(Movies) - 1 do
    if Movies[i].Country = Country then Inc(Count);
  Result := Count;
end;

procedure TForm1.B1Click(Sender: TObject);
begin
  G1.Cells[0,strnum+1]:=FN.Text;
  G1.Cells[1,strnum+1]:=FC.Text;
  G1.Cells[2,strnum+1]:=FB.Text;
  G1.Cells[3,strnum+1]:=FBO.Text;
  strnum:= strnum+1;
end;

procedure TForm1.B2Click(Sender: TObject);
begin
  // заполняем массив записей данными
  SetLength(Movies, strnum);
  For i:=0 to strnum-1 do
  begin
    Movies[i].Title := G1.Cells[0,i+1];
    Movies[i].Country := G1.Cells[1,i+1];
    Movies[i].ProductionCost := StrToIntDef(G1.Cells[2,i+1], 0);
    Movies[i].BoxOfficeRevenue := StrToIntDef(G1.Cells[3,i+1], 0);
  end;

  // создаем массив уникальных стран
  SetLength(Countries, Length(Movies));
  for i := 0 to Length(Movies) - 1 do
    if  pos(Countries[i], Movies[i].Country)<1 then
      Countries[i] := Movies[i].Country;

  // определяем страну, в которой снято больше всего фильмов
  MaxCount := -1;
  for i := 0 to Length(Countries) - 1 do
  begin
    if Countries[i] = '' then Continue; // пропускаем пустые элементы массива
    if CountMoviesByCountry(Movies, Countries[i]) > MaxCount then
    begin
      MaxCount := CountMoviesByCountry(Movies, Countries[i]);
      MaxIndex := i;
    end;
  end;
  G2.Cells[0,1]:=Countries[MaxIndex];
  G2.Cells[1,1]:=IntToStr(MaxCount);

end;

end.

