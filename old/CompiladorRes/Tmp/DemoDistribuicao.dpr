program DemoDistribuicao;


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

Uses
  Forms,
  Unit_Acesso in 'Unit_Acesso.pas' {UnitDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TUnitDemo, UnitDemo);
  Application.Run;
end.
