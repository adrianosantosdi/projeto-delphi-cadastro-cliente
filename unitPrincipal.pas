unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask;

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
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitarEdits;
    procedure LimparCampos;
    procedure InserirDados;
    procedure PopularDados;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unitDM;

procedure TForm1.btnGravarClick(Sender: TObject);
begin
  LimparCampos;
  InserirDados;

end;

procedure TForm1.btnNovoClick(Sender: TObject);
begin
  if MessageDlg('Deseja criar um novo registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then;
  HabilitarEdits;
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
      close;
      SQL.Clear;
      SQL.Add('insert into clients (nome, sobrenome, data_nascimento peso, sexo, email');
      SQL.Add('cidade, bairro, endereco, uf, profissao values )');
      SQL.Add('(:pnome, :psobrenome, :pdata_nascimento, :ppeso, :psexo, :pemail, :pcidade)');
      SQL.Add('(:pbairro, :pendereco, :puf, :pprofissao)');
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

procedure TForm1.PopularDados;
begin

end;

end.
