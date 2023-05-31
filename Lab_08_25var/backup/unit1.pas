unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    B1: TButton;
    E1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    M1: TMemo;
    procedure B1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

 var
  FolderPath: string;
  SearchRec: TSearchRec;
  FileName: string;
  FileHandle: TextFile;
  LineNumber, Count: Integer;
  Line: string;

{ TForm1 }

procedure TForm1.B1Click(Sender: TObject);
begin
  FolderPath:=E1.Text;
  if FindFirst(FolderPath + '\*.*', faAnyFile - faDirectory, SearchRec) = 0 then
  begin
    repeat
      FileName := SearchRec.Name;
      AssignFile(FileHandle, FolderPath + '\' + FileName);
      Reset(FileHandle);

      LineNumber := 0;
      Count := 1;

      while not EOF(FileHandle) do
      begin
        Inc(LineNumber);
        Readln(FileHandle, Line);
        if Pos('STR', AnsiUpperCase(Line)) > 0 then
        begin
          Inc(Count);
          M1.Lines.Add('Naydeno v  ' + FileName + ' na stroke ' + IntToStr(LineNumber));
        end;
      end;

      CloseFile(FileHandle);

      if Count = 1 then
        M1.Lines.Add('Nichego ne naydeno v ' + FileName);

    until FindNext(SearchRec) <> 0;

    FindClose(SearchRec);
  end;
  Label4.Caption:=IntToStr(Count);
end;

{$R *.lfm}

end.

