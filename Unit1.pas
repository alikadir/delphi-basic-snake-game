unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, SUIForm;

type
  TForm1 = class(TForm)
    basla: TButton;
    sag1: TTimer;
    sol1: TTimer;
    yuk1: TTimer;
    asa1: TTimer;
    sag0: TTimer;
    sol0: TTimer;
    yuk0: TTimer;
    asa0: TTimer;
    puan: TLabel;
    kordinat: TLabel;
    seviye: TLabel;
    coder: TLabel;
    procedure FormCreate(Sender: TObject);
   
    procedure baslaClick(Sender: TObject);
      procedure sag1Timer(Sender: TObject);
    procedure sag0Timer(Sender: TObject);
     procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure yuk1Timer(Sender: TObject);
    procedure yuk0Timer(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   hiz1,hiz0:integer;

   sagx0,sagx1,sagy0,sagy1,
   solx0,solx1,soly0,soly1,
   asax0,asax1,asay0,asay1,
   yukx0,yukx1,yuky0,yuky1:integer;


   implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin

sag1.Enabled:=false;
sag0.Enabled:=false;
sol1.Enabled:=false;
sol0.Enabled:=false;
yuk1.Enabled:=false;
yuk0.Enabled:=false;
asa1.Enabled:=false;
asa0.Enabled:=false;


   sagx0:=0;sagx1:=0;sagy0:=0;sagy1:=0;
   solx0:=0;solx1:=0;soly0:=0;soly1:=0;
   asax0:=0;asax1:=0;asay0:=0;asay1:=0;
   yukx0:=0;yukx1:=0;yuky0:=0;yuky1:=0;
   kordinat.Caption:='width '+inttostr(form1.Width)+#13+'height '+inttostr(form1.Height);
    form1.canvas.Pen.Width:=form1.canvas.Pen.Width+2;
   end;



 procedure TForm1.baslaClick(Sender: TObject);
begin

 sagx0:=(form1.Width div 3);
  sagy0:=(form1.Height div 3);
  sagx1:=sagx0+90;
  sagy1:=sagy0;
 sag1.Enabled:=true;
 sag0.Enabled:=true;
 basla.Enabled:=false;

 end;

 procedure TForm1.sag1Timer(Sender: TObject);
begin
 sagx1:=sagx1 +5;
end;

procedure TForm1.sag0Timer(Sender: TObject);
begin

              if (yuk0.Enabled=false) then form1.Refresh;
  sagx0:=sagx0 +5 ;
  form1.Canvas.MoveTo(sagx0,sagy0);
  form1.Canvas.LineTo(sagx1,sagy1);

              if (sagx0>=sagx1) then
                begin
                  if (yuk1.Enabled=true)then
                   begin
                   yuk0.Enabled:=true;
                   yukx0:=sagx0;
                   yuky0:=sagy0;

                   sag0.Enabled:=false;

                   end;
end;
              end;

 
procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

 begin
     if (Key=VK_UP) or (Key=Ord('W')) Then //yukarý W Tuþuna
     begin
           if (sag1.Enabled=true) then
             begin
               sag1.Enabled:=false;
               yukx1:=sagx1;
               yuky1:=sagy1;
               yuk1.Enabled:=true;
             end;
   
     end;
 end;


  procedure TForm1.yuk1Timer(Sender: TObject);
 begin
      yuky1:=yuky1-5;

           if (yuk0.Enabled=false) then
            begin
            yukx0:=sagx1;
            yuky0:=sagy1;
            form1.Canvas.LineTo(yukx1,yuky1);
            form1.Canvas.MoveTo(yukx0,yuky0);
            end;

  end;


 procedure TForm1.yuk0Timer(Sender: TObject);
  begin
  form1.Refresh;
  yuky0:=yuky0-5 ;
 form1.Canvas.MoveTo(yukx0,yuky0);
  form1.Canvas.LineTo(yukx1,yuky1);
  end;
end.

