Program Data_Mahasiswa; 
uses crt;

    type
          tanggal = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string [10];
          no_rumah : integer;
    end;


   var
       file_mhs : file of tanggal;
       mhs  	: array[0..20] of tanggal;
       Pil,Ul : Char;
	   
	   
Procedure Menu; 
Begin 
	Clrscr; 
	Gotoxy(34,1);Write('MENU PILIHAN'); 
	Gotoxy(34,2);Write('============'); 
	Gotoxy(27,4);Write('1. Input Data Mahasiswa'); 
	Gotoxy(27,5);Write('2. Output Data Mahasiswa'); 
	Gotoxy(27,6);Write('3. Hapus Data Mahasiswa'); 
	Gotoxy(27,7);Write('4. Edit Data Mahasiswa'); 
	Gotoxy(27,8);Write('5. Insert Data Mahasiswa'); 
	Gotoxy(27,9);Write('6. Tambah Data Mahasiswa'); 
	Gotoxy(27,10);Write('7. Keluar (Exit)'); 
	Gotoxy(32,12);Write('Pilihan [1..7]: ');Pil:=Readkey; 
End;

Procedure Input; 
Var 
		Lagi	: Char;
		i,j 	: integer;
        
begin
		Ul:='Y';
		Lagi:='Y';
		assign (file_mhs,'D:\f_mhs.dat');
           rewrite(file_mhs);
           i:=0;
           repeat
               
              clrscr;
              writeln('Mengisi tanggal pada File Mhs.dat');
              writeln;
              writeln('Mengisi tanggal ke ',i+1);
              writeln;
              begin
                   write('Nama                        : ');readln(mhs[i].nama);
                   write('Npm                         : ');readln(mhs[i].npm);
                   write('Tanggal Lahir(dd/mm/yyyy)   : ');read(mhs[i].tgl_lhr);
                   write('No Rumah                    : ');readln(mhs[i].no_rumah);
              end;
              write(file_mhs,mhs[i]);
              i:=i+1;
			  writeln;
              write('Isi lagi?(y/t) : ');readln(lagi);
        until lagi = 't';
        clrscr;
        close(file_mhs);
   end;

   
 Procedure Output;
Var 
		Lagi	: Char;
		i,j,jm 	: integer;
const
    garis='--------------------------------------------------------------------';
   
 
 begin
    Ul:='Y';
	 assign (file_mhs,'D:\f_mhs.dat');
     reset(file_mhs);
     jm:=filesize(file_mhs);
     clrscr;
     writeln(' ':25,'Data Mahasiswa SMSI03');
     writeln(' ':25,'---------------------');
     writeln;
     writeln(garis);
     writeln('|No|       Nama       |     NPM     |  Tanggal Lahir  |  No Rumah  |');
     writeln(garis);
     for j:= 0 to jm-1 do
     begin
          gotoxy(1,wherey);write('|',j+1,' |');
          read(file_mhs,mhs[j]);
          begin
             gotoxy(6,wherey);write(mhs[j].nama);
             gotoxy(23,wherey);write('|  ',mhs[j].npm);
             gotoxy(37,wherey);write('| ',mhs[j].tgl_lhr);
             gotoxy(55,wherey);write('| ',mhs[j].no_rumah);gotoxy(68,wherey);write('|');
          end;
          writeln;
     end;

     writeln(garis);
     close(file_mhs);
     readln;
end;

Procedure Hapus;
var
	i      : integer;
   FileTmp : File of tanggal;
   Lagi,Hapus: Char;
   Ada : Boolean;
   npmcari : string[8];
   
Begin
	Ul:='Y';
	Lagi:='y';
	Clrscr;
	Repeat
		Assign(file_mhs,'D:\f_mhs.Dat');

		Reset(file_mhs);

		If IOResult<>0 Then
			Write('Data Masih Kosong...!')
		Else
			Begin
				Clrscr;
				Assign(FileTmp,'D:\Mhs.tmp');
				Rewrite(FileTmp);
				Ada:=False;
				i:=0;
				Gotoxy(30,1);Write('HAPUS DATA MAHASISWA');
				Gotoxy(30,2);Write('=====================');
				Gotoxy(20,4);Write('NPM                  : ');Readln(npmcari);
				While (Ada=False) And (i<>Filesize(file_mhs)) Do
				Begin
					Seek(file_mhs,i);
					Read(file_mhs,mhs[i]);
					If mhs[i].npm=npmcari Then
						Ada:=True
					Else
						Inc(i);
				End;
	              	If (Ada=True) Then
			Begin
			Gotoxy(20,5);Write('Nama tanggal         : ',mhs[i].Nama);
			Gotoxy(20,6);Write('Tanggal Lahir        : ',mhs[i].tgl_lhr);
			Gotoxy(20,7);Write('Nomor Rumah          : ',mhs[i].no_rumah);
			Gotoxy(20,10);Write('Data  Ini  Mau  Di  Hapus  [Y/T]:');
			Readln(Hapus);
			If Upcase(Hapus)='Y' Then
			Begin
				For i := 0 to Filesize(file_mhs)-1 Do
			Begin
			Seek(file_mhs,i);
			Read(file_mhs,mhs[i]);
			If mhs[i].NPM<>npmcari Then
			Write(FileTmp,mhs[i]);
			End;
			Close(file_mhs);
			Assign(file_mhs,'D:\f_mhs.Dat');
			Erase(file_mhs);
			Assign(FileTmp,'D:\mhs.tmp');
			Rename(FileTmp,'D:\f_mhs.Dat');
			Gotoxy(20,10);Write('NPM  "',npmcari,'"  Sudah Di Hapus!');
		End;
	End
	Else
	Begin
	Gotoxy(20,10);Write('NPM  "',npmcari,'"  Ini  Tidak Ada!');
	End;
	Gotoxy(20,11);Write('Mau  Hapus  Data  Lagi  [Y/T]: ');Lagi:=Upcase(Readkey);
	End;
	Until Lagi<>'Y';
	End;
  
  Procedure Edit;
  var
   i           	: integer;
   FileTmp 		: File of tanggal;
   Lagi,Hapus	: Char;
   Ada 			: Boolean;
   npmcari 		: string[8];
   
  Begin 
	 Ul:='Y';
	Lagi:='Y'; 
	Clrscr; 

	Assign(file_mhs,'D:\f_mhs.Dat');
	Reset(file_mhs);
	If IOResult<>0 Then 
	Write('Data Masih Kosong...!') 
	Else 
		Begin 
			Repeat 
				Clrscr;
				Ada:=False; 
				i:=0; 
				Gotoxy(30,1);Write('EDIT DATA MAHASISWA'); 
				Gotoxy(30,2);Write('=====================');
				Gotoxy(20,4);Write('NPM              : ');Readln(npmcari);
				While (Ada=False) And (i<>Filesize(file_mhs)) Do
					Begin
						Seek(file_mhs,i);
						Read(file_mhs,mhs[i]);
						If mhs[i].npm=npmcari Then
							Begin
							Ada:=True;
							Gotoxy(20,5);Write('Nama Mahasiswa   : ',mhs[i].Nama);
							Gotoxy(20,6);Write('Tanggal Lahir    : ',mhs[i].tgl_lhr);
							Gotoxy(20,7);Write('No Rumah         : ',mhs[i].no_rumah);
							End
						Else
							Inc(i);
					End;
			If (Ada=True) Then
				Begin
				mhs[i].npm:=npmcari;
				Gotoxy(20,9);Write('Nama Mahasiswa   : ');Readln(mhs[i].Nama);
				Gotoxy(20,10);Write('Tanggal Lahir    : ');Readln(mhs[i].tgl_lhr);
				Gotoxy(20,11);Write('No Rumah         : ');Readln(mhs[i].no_rumah);
				Seek(file_mhs,i);
				Write(file_mhs,mhs[i]);
			End
			Else
				Begin
					Gotoxy(20,13);Write('NPM  "',npmcari,'"  Ini  Tidak Ada!');
				End;
			Gotoxy(20,14);Write('Mau  Edit  Data  Lagi  [Y/T]: ');
			Lagi:=Upcase(Readkey);
		Until Lagi<>'Y';
	End;
Close(file_mhs);
End;

Procedure Insert;
var
   temp            : array[0..20] of tanggal;
   i,jm,j              : integer;
   FileTmp        : File of tanggal;
   Lagi,Hapus     : Char;
   Ada            : Boolean;
   npmcari        : string[8];
   
  Begin
	Ul:='Y';
	Lagi:='Y';
	Clrscr; 	
	Assign(file_mhs,'D:\f_mhs.Dat');
	Reset(file_mhs);
	If IOResult<>0 Then 
		Rewrite(file_mhs); 
		
	Repeat 
		Clrscr;
		Ada:=False;
		i:=0;
		Gotoxy(30,1);Write('INSERT DATA MAHASISWA'); 
		Gotoxy(30,2);Write('====================='); 
		Gotoxy(20,4);Write('Ingin Menginsert pada Posisi Data ke          : ');Readln(j);
		clrscr;
		Gotoxy(30,1);Write('INSERT DATA MAHASISWA'); 
		Gotoxy(30,2);Write('====================='); 
		Gotoxy(20,4);Write('NPM                         : ');Readln(npmcari);
	While (Ada=False) And (i<>Filesize(file_mhs)) Do
		Begin
			Seek(file_mhs,i);
			Read(file_mhs,mhs[i]);
			If mhs[i].NPM=npmcari Then
				Ada:=True
			Else
				Inc(i);
		End;

	If (Ada=True) Then
		Begin
		Gotoxy(20,9);Write('NPM  "',npmcari,'"  Ini  Sudah Ada!');
		End
	Else
		Begin
			jm:=filesize(file_mhs);
			for i:= jm downto j do
			begin
			mhs[i]:=mhs[i-1];
                        Seek(file_mhs,i);
			write(file_mhs,mhs[i]);
			end;
			Seek(file_mhs,j-1);
			mhs[j-1].NPM:=npmcari;
			Gotoxy(20,5);Write('Nama Mahasiswa              : ');Readln(mhs[j-1].Nama);
			Gotoxy(20,6);Write('Tanggal Lahir (dd/mm/yyyy)  : ');Readln(mhs[j-1].tgl_lhr);
			Gotoxy(20,7);Write('Nomor Rumah                 : ');Readln(mhs[j-1].no_rumah);
			write(file_mhs,mhs[j-1]);
		End;
	Gotoxy(20,10);Write('Mau  Tambah  Data  Lagi  [Y/T]: ');
	Lagi:=Upcase(Readkey);
	Until Lagi<>'Y';
	Close(file_mhs);
End;

Procedure Tambah;
var
   i,jm              : integer;
   FileTmp        : File of tanggal;
   Lagi,Hapus     : Char;
   Ada            : Boolean;
   npmcari        : string[8];

  Begin
	Ul:='Y';
	Lagi:='Y';
	Clrscr; 	
	Assign(file_mhs,'D:\f_mhs.Dat');
	Reset(file_mhs);
	If IOResult<>0 Then 
		Rewrite(file_mhs); 
		
	Repeat 
		Clrscr;
		Ada:=False;
		i:=0;
		Gotoxy(30,1);Write('TAMBAH DATA MAHASISWA');
		Gotoxy(30,2);Write('=====================');
		Gotoxy(20,4);Write('NPM                         : ');Readln(npmcari);
	While (Ada=False) And (i<>Filesize(file_mhs)) Do
		Begin
			Seek(file_mhs,i);
			Read(file_mhs,mhs[i]);
			If mhs[i].NPM=npmcari Then
				Ada:=True
			Else
				Inc(i);
		End;

	If (Ada=True) Then
		Begin
		Gotoxy(20,9);Write('NPM  "',npmcari,'"  Ini  Sudah Ada!');
		End
	Else
		Begin
			jm:=filesize(file_mhs);
			Seek(file_mhs,jm);
			mhs[jm].NPM:=npmcari;
			Gotoxy(20,5);Write('Nama Mahasiswa              : ');Readln(mhs[jm].Nama);
			Gotoxy(20,6);Write('Tanggal Lahir (dd/mm/yyyy)  : ');Readln(mhs[jm].tgl_lhr);
			Gotoxy(20,7);Write('Nomor Rumah                 : ');Readln(mhs[jm].no_rumah);
			Write(file_mhs,mhs[jm]);
		End;
	Gotoxy(20,10);Write('Mau  Tambah  Data  Lagi  [Y/T]: ');
	Lagi:=Upcase(Readkey);
	Until Lagi<>'Y';
	Close(file_mhs);
End;

Begin 
	Repeat 
	Menu; 
	Case Pil Of 
		'1' : Input; 
		'2' : Output; 
		'3' : Hapus; 
		'4' : Edit; 
		'5' : Insert; 
		'6' : Tambah; 
		End; 
	Until (Ul<>'Y') Or (Pil='7');
End. 