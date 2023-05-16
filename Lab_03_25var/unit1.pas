unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

function IsAlpha(str: string): boolean;
var
  i: integer;
begin
  Result := True;
  for i := 1 to Length(str) do
    if not (str[i] in ['a'..'z', 'A'..'Z']) then begin
      Result := False;
      Break;
    end;
end;

function FindLongestAlphaWord(inputString: String): String;
var
  longestWord, currentWord: String;
  i: Integer;
begin
  longestWord := '';
  currentWord := '';

  for i := 1 to Length(inputString) do
  begin
    if (inputString[i] >= 'A') and (inputString[i] <= 'Z') or (inputString[i] >= 'a') and (inputString[i] <= 'z') then
      currentWord := currentWord + inputString[i]
    else
    begin
      if (Length(currentWord) > Length(longestWord)) and (IsAlpha(currentWord)) then
        longestWord := currentWord;

      currentWord := '';
    end;
  end;

  if (Length(currentWord) > Length(longestWord)) and (IsAlpha(currentWord)) then
    longestWord := currentWord;

  Result := longestWord;
end;


{ TForm1 }

function ReverseString(const s: string): string;
var
  i: Integer;
begin
  SetLength(Result, Length(s));
  for i := 1 to Length(s) do
    Result[i] := s[Length(s) - i + 1];
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  inputString, longestAlphaWord,Final: String;
begin
  Memo2.Lines.Clear;
  inputString:=Memo1.Lines[0];
  longestAlphaWord := FindLongestAlphaWord(inputString);
  Final:=ReverseString(longestAlphaWord);
  Memo2.Lines.Add(Final);
end;

end.



