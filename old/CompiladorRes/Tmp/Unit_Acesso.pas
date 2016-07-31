unit Unit_Acesso;

{#################################################################################################
                   EXEMPLO DE DISTRIBUI��O DE ARQUIVOS COMPILADOS EM DELPHI
#################################################################################################

   Esse sistema foi criado com o intuito de demonstrar como compilar e distribuir multiplos arquivos
dentro de uma aplica��o compilada em delphi.

   Exemplo criado em DELPHI 2009 compativel com todos os delphi existentes

  Autor...: Daniel Oliveira Rodrigues
  Email...: Dor_poa@hotmail.com
  Empresa.: Azanona Tecnologia (www.azanonatec.com.br)
  Local...: Porto Alegre - RS
 Criado em:31/07/2016 18:30:40
}

interface

uses

Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

Type
  TUnitDemo = class(TForm)
    Bnt_Executardescompialacao: TButton;
    Bnt_Sair: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    procedure Bnt_SairClick(Sender: TObject);
    procedure Bnt_ExecutardescompialacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure ResgataArquivoCompilado(Arquivo, Tipo, LocalDeSalvamento:String);
    { Public declarations }
  end;

var
  UnitDemo: TUnitDemo;

implementation

{$R *.dfm}
{$R CompilacaoAztec.RES}

procedure TUnitDemo.ResgataArquivoCompilado(Arquivo, Tipo, LocalDeSalvamento: String);
Var
   NomeSalvamento,
   NomesalvamentoTotal : String;
   Res : TResourceStream;
Begin
  //Biblioteca que acessa o conteudo da compila��o de acordo com o pedido
  if pos(Tipo, Arquivo) > 0 then
     NomeSalvamento      := Copy(Arquivo, 0, (pos(Tipo, Arquivo)-1)) else
     NomeSalvamento      := Arquivo;
  NomesalvamentoTotal := LocalDeSalvamento + NomeSalvamento + '.' + Tipo;
  If not FileExists(NomesalvamentoTotal) Then
  Begin
    Try
    //  Fun�ao convertida para novas vers�es do Delphi (2009 ou superior) 
      Res := TResourceStream.Create(Hinstance, Arquivo, PWideChar(Tipo));
    //  Fun�ao convertida para vers�es antiga do Delphi (inferior ao 2009) 
    //  Res := TResourceStream.Create(Hinstance, Arquivo, PAnsiChar(Tipo));
      Try
         Res.SavetoFile(NomesalvamentoTotal);
      Finally
         Res.Free;
      End;
    Except
      ShowMessage('Arquivo ' + Arquivo + ' n�o existe internamente');
    End;
  End;
End;



{###############################################################################################}

Procedure TUnitDemo.Bnt_SairClick(Sender: TObject);
Begin
  Close;
End;

Procedure TUnitDemo.Bnt_ExecutardescompialacaoClick(Sender: TObject);
Begin
  ResgataArquivoCompilado('RTTTF','TTF',ExtractFilePath(Application.ExeName));

  ResgataArquivoCompilado('RALEWAYBOLDTTF','TTF',ExtractFilePath(Application.ExeName));

  ResgataArquivoCompilado('RALEWAYEXTRABOLDTTF','TTF',ExtractFilePath(Application.ExeName));

  ResgataArquivoCompilado('RALEWAYEXTRALIGHTTTF','TTF',ExtractFilePath(Application.ExeName));

  ResgataArquivoCompilado('RALEWAYHEAVYTTF','TTF',ExtractFilePath(Application.ExeName));

  ResgataArquivoCompilado('RALEWAYLIGHTTTF','TTF',ExtractFilePath(Application.ExeName));

  ResgataArquivoCompilado('RALEWAYMEDIUMTTF','TTF',ExtractFilePath(Application.ExeName));

  ResgataArquivoCompilado('RALEWAYREGULARTTF','TTF',ExtractFilePath(Application.ExeName));

  ResgataArquivoCompilado('RALEWAYSEMIBOLDTTF','TTF',ExtractFilePath(Application.ExeName));

End;

end.
