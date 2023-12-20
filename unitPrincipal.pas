unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    edtId: TEdit;
    Label3: TLabel;
    edtNome: TEdit;
    edtSobrenome: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    edtPeso: TEdit;
    edtSexo: TRadioGroup;
    Label7: TLabel;
    edtEmail: TEdit;
    Label8: TLabel;
    edtCidade: TEdit;
    Label9: TLabel;
    edtBairro: TEdit;
    Label10: TLabel;
    edtEndereco: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtProfissao: TEdit;
    comboUF: TComboBox;
    Panel3: TPanel;
    btnNovo: TButton;
    btnGravar: TButton;
    Button1: TButton;
    Label5: TLabel;
    maskDataNascimento: TMaskEdit;
    DBGrid1: TDBGrid;
    Label13: TLabel;
    edtPesquisa: TEdit;
    btnPesquisar: TButton;
    Panel4: TPanel;
    btnEditar: TButton;
    btnExcluir: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitarEdits;
    procedure DesabilitarEdits;
    procedure Pesquisar;
    procedure LimparCampos;
    procedure InserirDados;
    procedure Update;
    procedure Excluir;
    procedure PopularDados;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unitDM;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
    HabilitarEdits;
    Update;
    PageControl1.ActivePageIndex := 0;
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin
Excluir;
Pesquisar;

end;

procedure TForm1.btnGravarClick(Sender: TObject);
begin
   if trim(edtId.Text) = '' then
    InserirDados
  else
      PopularDados;

    LimparCampos;
    Pesquisar;


end;

procedure TForm1.btnNovoClick(Sender: TObject);
begin
  if MessageDlg('Deseja criar um novo registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then;
  HabilitarEdits;
end;

procedure TForm1.btnPesquisarClick(Sender: TObject);
begin
Pesquisar;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar o registro? ', mtConfirmation, [mbYes, mbNo], 0) =mrYes then;
  LimparCampos;
  DesabilitarEdits;

end;

procedure TForm1.DesabilitarEdits;
begin
  edtNome.Enabled := false;
  edtSobrenome.Enabled := false;
  maskDataNascimento.Enabled := false;
  edtPeso.Enabled := false;
  edtSexo.Enabled := false;
  edtEmail.Enabled := false;
  edtCidade.Enabled := false;
  edtBairro.Enabled := false;
  edtEndereco.Enabled := false;
  comboUF.Enabled := false;
  edtProfissao.Enabled := false;
end;

procedure TForm1.Excluir;
  var
    LID : integer;
begin
   lID := DM.QryClientes.FieldByName('id').AsInteger;

 with DM.QryClientes do
    begin
      close;
      SQL.Clear;
      SQL.Add('delete from clientes where id = :pid');
      ParamByName('pid').AsInteger :=  lID;
      ExecSQL;
      MessageDlg('Registro deletado com sucesso', mtInformation, [mbOK], 0);
    end;
end;

procedure TForm1.HabilitarEdits;
begin
  edtNome.Enabled := true;
  edtSobrenome.Enabled := true;
  maskDataNascimento.Enabled := true;
  edtPeso.Enabled := true;
  edtSexo.Enabled := true;
  edtEmail.Enabled := true;
  edtCidade.Enabled := true;
  edtBairro.Enabled := true;
  edtEndereco.Enabled := true;
  comboUF.Enabled := true;
  edtProfissao.Enabled := true;
end;

procedure TForm1.InserirDados;
begin
  with DM.QryClientes do
    begin
      Close;
      SQL.Clear;
      SQL.Add('insert into clientes (nome, sobrenome, data_nascimento, peso, sexo, ');
      SQL.Add( 'email, cidade, bairro , endereco, uf, profissao) values ');
      SQL.Add('(:pnome, :psobrenome, :pdata_nascimento, :ppeso, :psexo, :pemail, :pcidade, :pbairro, :pendereco, :puf, :pprofissao)');
      ParamByName('pnome').AsString := edtNome.Text;
      ParamByName('psobrenome').AsString := edtSobrenome.Text;
      ParamByName('pdata_nascimento').AsDate := StrToDate(maskDataNascimento.Text);
      ParamByName('ppeso').AsFloat := StrToFloat(edtPeso.Text);
      If comboUF.ItemIndex = 0 then
          ParamByName('psexo').asstring := 'M'
        else
          ParamByName('psexo').asstring := 'F';
      ParamByName('pemail').AsString := edtEmail.Text;
      ParamByName('pcidade').AsString := edtCidade.Text;
      ParamByName('pbairro').AsString := edtBairro.Text;
      ParamByName('pendereco').AsString := edtEndereco.Text;
      ParamByName('puf').AsString := comboUF.Text;
      ParamByName('pprofissao').AsString := edtProfissao.Text;
      ExecSQL;
      LimparCampos;
      Pesquisar;
    end;
end;

procedure TForm1.LimparCampos;
begin
  edtNome.Text := '';
  edtSobrenome.Text := '';
  edtPeso.Text := '';
  edtSexo.Caption := '';
  edtEmail.Text := '';
  edtCidade.Text := '';
  edtBairro.Text := '';
  edtEndereco.Text := '';
  comboUF.Text := '';
  edtProfissao.Text := '';


end;

procedure TForm1.Pesquisar;
begin
  DM.QryClientes.Close;
  DM.QryClientes.SQL.Clear;

  DM.QryClientes.SQL.Text := 'select * from clientes where nome like ' +  QuotedStr('%' + edtPesquisa.Text + '%') ;
  DM.QryClientes.Open();
end;

procedure TForm1.PopularDados;
begin
  edtId.Text              := DM.QryClientes.FieldByName('ID').AsString;
  edtNome.Text            := DM.QryClientes.FieldByName('NOME').AsString;
  edtSobrenome.Text       := DM.QryClientes.FieldByName('SOBRENOME').AsString;
  maskDataNascimento.Text := DM.QryClientes.FieldByName('DATA_NASCIMENTO').AsString;
  edtPeso.Text            := DM.QryClientes.FieldByName('PESO').AsString;
  edtSexo.Caption         := DM.QryClientes.FieldByName('SEXO').AsString;
  edtEmail.Text           := DM.QryClientes.FieldByName('EMAIL').AsString;
  edtCidade.Text          := DM.QryClientes.FieldByName('CIDADE').AsString;
  edtBairro.Text          := DM.QryClientes.FieldByName('BAIRRO').AsString;
  edtEndereco.Text        := DM.QryClientes.FieldByName('ENDERECO').AsString;
  comboUF.Text            := DM.QryClientes.FieldByName('UF').AsString;
  edtProfissao.Text 		  := DM.QryClientes.FieldByName('PROFISSAO').AsString;
end;

procedure TForm1.Update;
begin
  with DM.QryClientes do
   begin
     close;
     SQL.Clear;
     SQL.Add('update clientes                               ' +
                  '    set nome = :pnome,                   ' +
                  '    sobrenome = :psobrenome,             ' +
                  '    data_nascimento = :pdata_nascimento, ' +
                  '    peso = :ppeso,                       ' +
                  '    sexo = :psexo,                       ' +
                  '    email = :pemail,                     ' +
                  '    cidade = :pcidade,                   ' +
                  '    bairro = :pbairro,                   ' +
                  '    endereco = :pendereco,              ' +
                  '    uf = :puf,                          ' +
                  '    profissao = :pprofissao,             ' +
                  '    where id = :pid                      ');

   ParamByName('pid').AsInteger := StrToInt(edtId.Text);
   ParamByName('pnome').AsString := edtNome.Text;
   ParamByName('psobrenome').AsString := edtSobrenome.Text;
   ParamByName('pdata_nascimento').AsString := maskDataNascimento.Text;
   ParamByName('ppeso').AsString := edtPeso.Text;
       If comboUF.ItemIndex = 0 then
          ParamByName('psexo').asstring := 'M'
        else
          ParamByName('psexo').asstring := 'F';
   ParamByName('pemail').AsString := edtEmail.Text;
   ParamByName('pcidade').AsString := edtCidade.Text;
   ParamByName('pbairro').AsString := edtBairro.Text;
   ParamByName('pendereco').AsString := edtEndereco.Text;
   ParamByName('puf').AsString := comboUF.Text;
   ParamByName('pprofissao').AsString := edtProfissao.Text;
   ExecSQL;


   end;


end;

end.
