unit uPrin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    function LoadResourceFont(const ResourceName, FontName: string): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{$R Compilacao.RES}

function TForm1.LoadResourceFont( const ResourceName, FontName : string ) : boolean;
var
   ResStream : tResourceStream;
   FontsCount : integer;
   hFont : tHandle;
begin                                                           //PAnsiChar inferior ao 2009
   ResStream := tResourceStream.Create(hInstance, ResourceName, PWideChar('TTF'));
   hFont := AddFontMemResourceEx(ResStream.Memory, ResStream.Size, nil, @FontsCount);
   result := (hFont <> 0);
   ResStream.Free();
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
//
  if LoadResourceFont('RTTTF','TTF') then
  begin
    Label2.Font.Name :=  'Raleway';
    Repaint;
    Application.ProcessMessages;
  end;
  if LoadResourceFont('RALEWAYBOLDTTF','TTF') then
  begin
    Label3.Font.Name :=  'Raleway Bold';
    Label3.Font.Style :=  [fsbold];
    Application.ProcessMessages;
  end;
  if LoadResourceFont('RALEWAYEXTRABOLDTTF','TTF') then
  begin
    Label4.Font.Name :=  'Raleway ExtraBold';
    Repaint;
    Application.ProcessMessages;
  end;
  if LoadResourceFont('RALEWAYEXTRALIGHTTTF','TTF') then
  begin
    Label5.Font.Name :=  'Raleway ExtraLight';
    Repaint;
    Application.ProcessMessages;
  end;
  if LoadResourceFont('RALEWAYHEAVYTTF','TTF') then
  begin
    Label6.Font.Name :=  'Raleway Heavy';
    Repaint;
    Application.ProcessMessages;
  end;
  if LoadResourceFont('RALEWAYLIGHTTTF','TTF') then
  begin
    Label7.Font.Name :=  'Raleway Light';
    Repaint;
    Application.ProcessMessages;
  end;
  if LoadResourceFont('RALEWAYMEDIUMTTF','TTF') then
  begin
    Label8.Font.Name :=  'Raleway Medium';
    Repaint;
    Application.ProcessMessages;
  end;

end;

end.


